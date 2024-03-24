//=============================================================================
// 
//  �I�u�W�F�N�g���� [object.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "object.h"
#include "manager.h"
#include "3D_effect.h"
#include "camera.h"
#include "MyEffekseer.h"
#include "fog.h"

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================
int CObject::m_nNumAll = 0;	// ����
int CObject::m_nNumPriorityAll[mylib_const::PRIORITY_NUM] = {};
CObject *CObject::m_pTop[mylib_const::PRIORITY_NUM]= {};	// �擪�̃I�u�W�F�N�g�ւ̃|�C���^
CObject *CObject::m_pCur[mylib_const::PRIORITY_NUM]= {};	// �Ō���̃I�u�W�F�N�g�ւ̃|�C���^

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CObject::CObject(int nPriority)
{
	if (nPriority < 0 || nPriority >= mylib_const::PRIORITY_NUM)
	{// �͈͊O��������

		return;
	}

	// �l�̃N���A
	m_pos = 0.0f;		// �ʒu
	m_posOld = 0.0f;	// �O��̈ʒu
	m_rot = 0.0f;		// ����
	m_move = 0.0f;		// �ړ���
	m_rotOrigin = 0.0f;	// ���̌���

	m_pPrev = nullptr;	// �O�̃I�u�W�F�N�g�ւ̃|�C���^
	m_pNext = nullptr;	// ���̃I�u�W�F�N�g�ւ̃|�C���^
	m_nPriority = nPriority;	// �D�揇��
	m_type = TYPE_NONE;			// ���
	m_bDeath = false;			// ���S�t���O
	m_bDisp = true;			// �`��t���O
	memset(&m_pEffect[0], 0, sizeof(m_pEffect));	// �G�t�F�N�g�̃|�C���^
	m_nNumEffectParent = 0;		// �G�t�F�N�g�̐e�ݒ肵����
	m_bHitstopMove = false;		// �q�b�g�X�g�b�v���ɓ������̃t���O
	m_nNumAll++;				// �������Z
	m_nNumPriorityAll[nPriority]++;

	// �Ō����ۑ�
	CObject *pObjCur = m_pCur[nPriority];

	if (pObjCur != nullptr)
	{// �Ō�������݂��Ă�����

		pObjCur->m_pNext = this;				// �Ō���̎��Ɏ������g����

		m_pCur[nPriority] = this;				// �Ō�����������g�ɍX�V
		m_pCur[nPriority]->m_pPrev = pObjCur;	// �Ō���̑O�ɉߋ��̍Ō������
	}
	else
	{// �Ō��������������

		m_pCur[nPriority] = this;	// �Ō�����������g�ɍX�V
	}

	if (m_pTop[nPriority] == nullptr)
	{// �擪�ɉ����Ȃ�������

		m_pTop[nPriority] = this;	// �擪�Ɏ������g�̃|�C���^��n��
	}

}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CObject::~CObject()
{

}

//==========================================================================
// �S�ẴI�u�W�F�N�g�̔j��
//==========================================================================
void CObject::ReleaseAll()
{
	for (int nCntPriority = 0; nCntPriority < mylib_const::PRIORITY_NUM; nCntPriority++)
	{
		// �擪��ۑ�
		CObject *pObject = m_pTop[nCntPriority];

		while (pObject != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObject->m_pNext;

			if (pObject->m_type != TYPE_NONE)
			{// NONE����Ȃ����

				// �I������
				pObject->Uninit();
			}

			// ���̃I�u�W�F�N�g����
			pObject = pObjNext;
		}

		//*******************************
		// ���S����
		//*******************************
		// �擪��ۑ�
		pObject = m_pTop[nCntPriority];

		while (pObject != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObject->m_pNext;

			if (pObject->m_bDeath == true)
			{// ���S�t���O�������Ă�����

				// ���S���S����
				pObject->Death();
			}
			else
			{
				int n = 0;
			}

			// ���̃I�u�W�F�N�g����
			pObject = pObjNext;
		}
	}

	// �D�揇�ʓI�ɏ����Ȃ��������̂�S�폜
	for (int nCntPriority = 0; nCntPriority < mylib_const::PRIORITY_NUM; nCntPriority++)
	{
		// �擪��ۑ�
		CObject *pObject = m_pTop[nCntPriority];

		while (pObject != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObject->m_pNext;

			if (pObject->m_bDeath == true)
			{// ���S�t���O�������Ă�����

				// ���S���S����
				pObject->Death();
			}
			else
			{
				int n = 0;
			}

			// ���̃I�u�W�F�N�g����
			pObject = pObjNext;
		}
	}
}

//==========================================================================
// �S�ẴI�u�W�F�N�g�̍X�V����
//==========================================================================
void CObject::UpdateAll()
{
#if _DEBUG
	// �G�f�B�b�g�̏��擾
	CEdit *pEdit = CManager::GetInstance()->GetEdit();
#endif

	// �q�b�g�X�g�b�v����
	bool bHitstop = CManager::GetInstance()->IsHitStop();

	for (int nCntPriority = 0; nCntPriority < mylib_const::PRIORITY_NUM; nCntPriority++)
	{
		// �擪��ۑ�
		CObject *pObject = m_pTop[nCntPriority];

		while (pObject != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObject->m_pNext;

#if _DEBUG
			if (pObject->m_bDeath == false && pEdit != nullptr && (pObject->m_type == TYPE_EDIT || pObject->m_type == TYPE_XFILE || pObject->m_type == TYPE_ELEVATION) &&
				(pObject->m_bHitstopMove == true || (pObject->m_bHitstopMove == false && bHitstop == false)))
			{// �G�f�B�b�g��Ԃ�������G�f�B�b�g�̂ݍX�V

				// �X�V����
				pObject->Update();
			}
			else if (pObject->m_bDeath == false && pEdit == nullptr && pObject->m_type != TYPE_NONE &&
				(pObject->m_bHitstopMove == true || (pObject->m_bHitstopMove == false && bHitstop == false)))
			{// �G�f�B�b�g��Ԃ���Ȃ� && �^�C�v��NONE�ȊO

				// �X�V����
				pObject->Update();
			}
#else
			if (pObject->m_bDeath == false && pObject->m_type != TYPE_NONE &&
				(pObject->m_bHitstopMove == true || (pObject->m_bHitstopMove == false && bHitstop == false)))
			{// �^�C�v��NONE�ȊO

				// �X�V����
				pObject->Update();
			}
#endif

			// ���̃I�u�W�F�N�g����
			pObject = pObjNext;
		}

		//*******************************
		// ���S����
		//*******************************
		// �擪��ۑ�
		pObject = m_pTop[nCntPriority];

		while (pObject != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObject->m_pNext;

			if (pObject->m_bDeath == true)
			{// ���S�t���O�������Ă�����

				// ���S���S����
				pObject->Death();
			}

			// ���̃I�u�W�F�N�g����
			pObject = pObjNext;
		}
	}
}

//==========================================================================
// �S�ẴI�u�W�F�N�g�̕`�揈��
//==========================================================================
void CObject::DrawAll()
{
	for (int nCntPriority = 0; nCntPriority < mylib_const::PRIORITY_NUM; nCntPriority++)
	{
		if (nCntPriority == mylib_const::PRIORITY_ZSORT)
		{// Z�\�[�g�`��
			DrawZSort(nCntPriority);
		}
		else
		{// �ʏ�`��
			DrawNone(nCntPriority);
		}

		if (nCntPriority == 3)
		{
			// �G�t�F�N�V�A�̍X�V���`��
			CMyEffekseer* pEffekseer = CMyEffekseer::GetInstance();
			if (pEffekseer != nullptr)
			{
				pEffekseer->Update();
			}
		}
	}
}

//==========================================================================
// �ʏ�`��
//==========================================================================
void CObject::DrawNone(int nPriority)
{
	// �擪��ۑ�
	CObject *pObject = m_pTop[nPriority];

	while (pObject != nullptr)
	{// nullptr������܂Ŗ������[�v

		// ���̃I�u�W�F�N�g���ꎞ�ۑ�
		CObject *pObjNext = pObject->m_pNext;

		if (pObject->m_bDisp == true &&
			pObject->m_bDeath == false &&
			pObject->m_type != TYPE_NONE)
		{// NONE����Ȃ����

			// �`�揈��
			pObject->Draw();
		}

		// ���̃I�u�W�F�N�g����
		pObject = pObjNext;
	}
}

//==========================================================================
// Z�\�[�g�`��
//==========================================================================
void CObject::DrawZSort(int nPriority)
{
	// �擪��ۑ�
	CObject *pObject = m_pTop[nPriority];

	// ���X�g�R�s�[
	std::vector<CObject*> pObjectSort;
	while (pObject != nullptr)
	{
		// ���̃I�u�W�F�N�g���ꎞ�ۑ�
		CObject *pObjNext = pObject->m_pNext;

		// �v�f�𖖔��ɒǉ�
		pObjectSort.push_back(pObject);

		// ���̃I�u�W�F�N�g����
		pObject = pObjNext;
	}

	// Z�\�[�g
	std::sort(pObjectSort.begin(), pObjectSort.end(), ZSort);

	for (int i = 0; i < (int)pObjectSort.size(); i++)
	{
		if (pObjectSort[i]->m_bDisp == true
			&& pObjectSort[i]->m_bDeath == false
			&& pObjectSort[i]->m_type != TYPE_NONE)
		{// NONE����Ȃ����

			// �`�揈��
			pObjectSort[i]->Draw();
		}
	}
}

//==========================================================================
// �X�N���[�����W�擾(Z���W)
//==========================================================================
float CObject::ScreenZ() const 
{
	// �J�����̍��W�ϊ��s����擾
	D3DXMATRIX mtxCamera = CManager::GetInstance()->GetCamera()->GetMtxView();

	// �I�u�W�F�N�g���W���J��������̍��W�ɕϊ�
	MyLib::Vector3 screenPos;
	D3DXVec3TransformCoord(&screenPos, &m_pos, &mtxCamera);

	// �J�������_���猩��Z���W
	float screenZ = -screenPos.z;

	return screenZ;
}

//==========================================================================
// Z�\�[�g�̔�r�֐�
//==========================================================================
bool CObject::ZSort(const CObject *obj1, const CObject *obj2)
{
	bool bSort = false;
	if (obj1->ScreenZ() < obj2->ScreenZ())
	{
		bSort = true;
	}

	return bSort;
}

// �`��ݒ�
void CObject::SetEnableDisp(bool bDisp)
{
	m_bDisp = bDisp;
}

//==========================================================================
// �G�t�F�N�g�ݒ�
//==========================================================================
int CObject::SetEffectParent(CEffect3D *pEffect3D)
{
	int nIdx = 0;
	for (int nCntEffect = 0; nCntEffect < mylib_const::MAX_OBJ; nCntEffect++)
	{
		if (m_pEffect[nCntEffect] != nullptr)
		{// nullptr����Ȃ�������
			continue;
		}

		// �G�t�F�N�g�̃|�C���^��n��
		m_pEffect[nCntEffect] = pEffect3D;
		nIdx = nCntEffect;

		// �G�t�F�N�g�̐e�ݒ肵�������Z
		m_nNumEffectParent++;
		break;
	}

	return nIdx;
}

//==========================================================================
// �e�ݒ肵���G�t�F�N�g�̐��擾
//==========================================================================
int CObject::GetEffectParentNum()
{
	return m_nNumEffectParent;
}

//==========================================================================
// �e�ݒ肵���G�t�F�N�g�擾
//==========================================================================
CEffect3D *CObject::GetEffectParent(int nIdx)
{
	return m_pEffect[nIdx];
}

//==========================================================================
// �G�t�F�N�g�̉��
//==========================================================================
void CObject::ReleaseEffect(int nIdx)
{
	// �G�t�F�N�gnullptr�ɂ���
	m_pEffect[nIdx] = nullptr;

	// �G�t�F�N�g�̐e�ݒ肵�������Z
	m_nNumEffectParent--;
}

//==========================================================================
// �G�t�F�N�g�̉��
//==========================================================================
void CObject::UninitEffect()
{
	for (int nCntEffect = 0; nCntEffect < mylib_const::MAX_OBJ; nCntEffect++)
	{
		if (m_pEffect[nCntEffect] == nullptr)
		{// nullptr��������
			continue;
		}
		m_pEffect[nCntEffect]->UninitParent();
		m_pEffect[nCntEffect] = nullptr;
	}
}

//==========================================================================
// �I�u�W�F�N�g�̎��S����
//==========================================================================
void CObject::Release()
{
	// �G�t�F�N�g�̉��
	UninitEffect();

	// ���S�t���O�𗧂Ă�
	m_bDeath = true;
}

//==========================================================================
// �I�u�W�F�N�g�̔j���E���S����
//==========================================================================
void CObject::Death()
{
	// ����̔ԍ��ۑ�
	int nPriority = m_nPriority;

	// �I�u�W�F�N�g��ۑ�
	CObject *pObject = this;
	CObject *pObjNext = pObject->m_pNext;
	CObject *pObjPrev = pObject->m_pPrev;

	if (pObject == nullptr)
	{// nullptr��������
		return;
	}

	// �O�̃I�u�W�F�N�g�Ǝ��̃I�u�W�F�N�g���q��
	if (pObjNext == nullptr)
	{// �������Ō���̎�

		if (pObjPrev != nullptr)
		{// �O�̃I�u�W�F�N�g�������

			// �O�̃I�u�W�F�N�g�̎���nullptr�ɂ���
			pObjPrev->m_pNext = nullptr;

			// �Ō���������̑O�̃I�u�W�F�N�g�ɂ���
			m_pCur[nPriority] = pObjPrev;
		}
		else
		{// �O�̃I�u�W�F�N�g���Ȃ���

			// �Ō����nullptr�ɂ���
			m_pCur[nPriority] = nullptr;
		}
	}
	else
	{// �Ō������Ȃ��Ƃ�

		if (pObjPrev != nullptr)
		{// �������擪����Ȃ���

			// �O�̃I�u�W�F�N�g�̎���, �����̎��ɂ���
			pObjPrev->m_pNext = pObject->m_pNext;
		}

	}

	if (pObjPrev == nullptr)
	{// �������擪�̎�

		if (pObjNext != nullptr)
		{// ���̃I�u�W�F�N�g�����鎞

			// ���̃I�u�W�F�N�g�̑O��nullptr�ɂ���
			pObjNext->m_pPrev = nullptr;

			// �擪�������̎��̃I�u�W�F�N�g�ɂ���
			m_pTop[nPriority] = pObjNext;
		}
		else
		{// ���̃I�u�W�F�N�g���Ȃ���

			// �擪��nullptr�ɂ���
			m_pTop[nPriority] = nullptr;
		}
	}
	else
	{// �擪����Ȃ��Ƃ�

		if (pObjNext != nullptr)
		{// �������Ō������Ȃ���

			// ���̃I�u�W�F�N�g�̑O��, �����̑O�ɂ���
			pObjNext->m_pPrev = pObject->m_pPrev;
		}
	}

	//if (m_pReleaseNext == pObject)
	//{// �{�����ɏ����I�u�W�F�N�g�ƍ�������I�u�W�F�N�g�������Ƃ�
	//	m_pReleaseNext = pObjNext;
	//}

	// �������̊J��
	delete pObject;
	pObject = nullptr;

	// ���������炷
	m_nNumAll--;
	m_nNumPriorityAll[nPriority]--;
}

//==========================================================================
// ���_���ݒ菈��
//==========================================================================
void CObject::SetVtx()
{

}

//==========================================================================
// �ʒu�ݒ�
//==========================================================================
void CObject::SetPosition(const MyLib::Vector3& pos)
{
	m_pos = pos;
}

//==========================================================================
// �ʒu���Z
//==========================================================================
void CObject::AddPosition(const MyLib::Vector3& pos)
{
	m_pos += pos;
}

//==========================================================================
// �ʒu�擾
//==========================================================================
MyLib::Vector3 CObject::GetPosition() const
{
	return m_pos;
}

//==========================================================================
// �ʒu�ݒ�
//==========================================================================
void CObject::SetOldPosition(const MyLib::Vector3& posOld)
{
	m_posOld = posOld;
}

//==========================================================================
// �ʒu�擾
//==========================================================================
MyLib::Vector3 CObject::GetOldPosition() const
{
	return m_posOld;
}

//==========================================================================
// ���̈ʒu�ݒ�
//==========================================================================
void CObject::SetOriginPosition(const MyLib::Vector3& pos)
{
	m_posOrigin = pos;
}

//==========================================================================
// ���̈ʒu�擾
//==========================================================================
MyLib::Vector3 CObject::GetOriginPosition() const
{
	return m_posOrigin;
}

//==========================================================================
// �ړ��ʐݒ�
//==========================================================================
void CObject::SetMove(const MyLib::Vector3& move)
{
	m_move = move;
}

//==========================================================================
// �ړ��ʎ擾
//==========================================================================
MyLib::Vector3 CObject::GetMove() const
{
	return m_move;
}

//==========================================================================
// �����ݒ�
//==========================================================================
void CObject::SetRotation(const MyLib::Vector3& rot)
{
	m_rot = rot;
}

//==========================================================================
// �����擾
//==========================================================================
MyLib::Vector3 CObject::GetRotation() const
{
	return m_rot;
}

//==========================================================================
// ���̌����ݒ�
//==========================================================================
void CObject::SetOriginRotation(const MyLib::Vector3& rot)
{
	m_rotOrigin = rot;
}

//==========================================================================
// ���̌����擾
//==========================================================================
MyLib::Vector3 CObject::GetOriginRotation() const
{
	return m_rotOrigin;
}

//==========================================================================
// ��ނ̐ݒ�
//==========================================================================
void CObject::SetType(const TYPE type)
{
	m_type = type;
}

//==========================================================================
// ��ނ̎擾
//==========================================================================
CObject::TYPE CObject::GetType() const
{
	return m_type;
}

//==========================================================================
// �I�u�W�F�N�g�̎擾
//==========================================================================
CObject *CObject::GetObject()
{
	return this;
}

//==========================================================================
// �擪�̃I�u�W�F�N�g�擾
//==========================================================================
CObject *CObject::GetTop(int nPriority)
{
	return m_pTop[nPriority];
}

//==========================================================================
// ���̃I�u�W�F�N�g�擾
//==========================================================================
CObject *CObject::GetNext()
{
	return this->m_pNext;
}

//==========================================================================
// ���S�̔���
//==========================================================================
bool CObject::IsDeath()
{
	return m_bDeath;
}

//==========================================================================
// �I�u�W�F�N�g2D�I�u�W�F�N�g�̎擾
//==========================================================================
CObject2D *CObject::GetObject2D()
{
	return nullptr;
}

//==========================================================================
// �I�u�W�F�N�g3D�I�u�W�F�N�g�̎擾
//==========================================================================
CObject3D *CObject::GetObject3D()
{
	return nullptr;
}

//==========================================================================
// �I�u�W�F�N�g3D���b�V���I�u�W�F�N�g�̎擾
//==========================================================================
CObject3DMesh *CObject::GetObject3DMesh()
{
	return nullptr;
}

//==========================================================================
// �I�u�W�F�N�gX�I�u�W�F�N�g�̎擾
//==========================================================================
CObjectX *CObject::GetObjectX()
{
	return nullptr;
}

//==========================================================================
// �I�u�W�F�N�g�L�����N�^�[�I�u�W�F�N�g�̎擾
//==========================================================================
CObjectChara *CObject::GetObjectChara()
{
	return nullptr;
}