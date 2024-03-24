//=============================================================================
// 
//  �G�f�B�b�g���� [edit.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "objectX.h"
#include "XLoad.h"
#include "edit.h"
#include "manager.h"
#include "renderer.h"
#include "calculation.h"
#include "debugproc.h"
#include "input.h"
#include "camera.h"
#include "map.h"
#include "game.h"
#include "elevation.h"

//==========================================================================
// �}�N����`
//==========================================================================
#define MOVE		(10.0f)
#define MOVE_SLOW	(1.0f)

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================
CObjectX *CEdit::m_pObjX = nullptr;
int CEdit::m_nNumAll = 0;	// ����
int CEdit::m_nType = 0;		// �^�C�v
bool CEdit::m_bShadow = false;	// �e���g�����ǂ���

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEdit::CEdit(int nPriority) : CObject(nPriority)
{
	m_posOld = MyLib::Vector3(0.0f, 0.0f, 0.0f);	// �O��̈ʒu
	m_bShadow = true;	// �e���g�����ǂ���

	// �������Z
	m_nNumAll++;
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEdit::~CEdit()
{

}

//==========================================================================
// ��������
//==========================================================================
CEdit *CEdit::Create()
{
	// �����p�̃I�u�W�F�N�g
	CEdit *pObjectX = nullptr;

	if (pObjectX == nullptr)
	{// nullptr��������

		// �������̊m��
		pObjectX = DEBUG_NEW CEdit;

		//if (pObjectX->GetID() < 0)
		//{// �������m�ۂɎ��s���Ă�����

		//	delete pObjectX;
		//	return nullptr;
		//}

		if (pObjectX != nullptr)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			HRESULT hr = pObjectX->Init();

			if (FAILED(hr))
			{// ���s���Ă�����
				return nullptr;
			}

			// ��ސݒ�
			pObjectX->SetType(TYPE_EDIT);
		}

		return pObjectX;
	}

	return nullptr;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEdit::Init()
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ��������
	m_pObjX = m_pObjX->Create(CXLoad::GetInstance()->GetMyObject(m_nType)->filename.c_str());
	m_pObjX->SetType(TYPE_EDIT);

	if (m_pObjX == nullptr)
	{// ���s���Ă�����
		return E_FAIL;
	}

	return S_OK;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEdit::Init(const char *pFileName)
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();
	
	// ��������
	m_pObjX = m_pObjX->Create(pFileName);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CEdit::Uninit()
{
	// �I�u�W�F�N�g�̔j��
	CObject::Release();
}

//==========================================================================
// �j���̏���
//==========================================================================
void CEdit::Release()
{
	// �I������
	m_pObjX->CObjectX::Uninit();
	CEdit::Uninit();
}

//==========================================================================
// �X�V����
//==========================================================================
void CEdit::Update()
{
	// �L�[�{�[�h���擾
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	// �ʒu�擾
	MyLib::Vector3 pos = m_pObjX->GetPosition();

	// �����擾
	MyLib::Vector3 rot = m_pObjX->GetRotation();

	// ����
	Control(m_pObjX);

	// ��ޕύX
	ChangeType();

	// �݈͂ړ�
	GrabModel();

	if (pInputKeyboard->GetTrigger(DIK_RETURN) == true)
	{// ENTER�Ŕz�u

		// �^�C�v�̕��𐶐�
		MyMap::Regist(m_nType, pos, rot, m_bShadow);
	}

	if (pInputKeyboard->GetTrigger(DIK_F9) == true)
	{// �Z�[�u

		// �e�L�X�g�ɃZ�[�u
		MyMap::SaveText();
	}

	// �f�o�b�O���
	CManager::GetInstance()->GetDebugProc()->Print(
		"------------------[ �}�b�v�G�f�B�^ ]------------------\n"
		"<���f���z�u>   [ENTER]\n"
		"<�t�@�C���ۑ�> [F9] �ydata/TEXT/edit_info.txt�z\n"
		"<�ړ�>         �����F[��,��,��,��]�@�ᑬ�F[W,A,S,D]\n"
		"<��]>         [LSHIFT, RSHIFT]\n"
		"<�㏸,���~>    [I,K]\n"
		"<��ޕύX>     [1, 2][%d]\n"
		"<�e�̎g�p��> [3][%d]\n"
		"<�݈͂ړ�>     [SPACE]\n"
		"<�폜>         [DELETE]\n"
		"<�ʒu>         [X�F%f Y�F%f Z�F%f]\n"
		"<����>         [X�F%f Y�F%f Z�F%f]\n"
		"\n", m_nType, (int)m_bShadow, pos.x, pos.y, pos.z, rot.x, rot.y, rot.z);
}

//==========================================================================
// ���쏈��
//==========================================================================
void CEdit::Control(CObjectX *pObjX)
{
	// �J�����̏��擾
	CCamera *pCamera = CManager::GetInstance()->GetCamera();

	// �J�����̌����擾
	MyLib::Vector3 Camerarot = pCamera->GetRotation();

	// �L�[�{�[�h���擾
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	// �ʒu�擾
	MyLib::Vector3 pos = pObjX->GetPosition();

	// �����擾
	MyLib::Vector3 rot = pObjX->GetRotation();

	if (pInputKeyboard->GetPress(DIK_LEFT) == true)
	{// ���L�[�������ꂽ,���ړ�

		if (pInputKeyboard->GetPress(DIK_UP) == true)
		{// A+W,����ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE;
			pos.z += cosf(-D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE;
		}
		else if (pInputKeyboard->GetPress(DIK_DOWN) == true)
		{// A+S,�����ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE;
			pos.z += cosf(-D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE;
		}
		else
		{// A,���ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LR + Camerarot.y) * MOVE;
			pos.z += cosf(-D3DX_PI * MOVE_LR + Camerarot.y) * MOVE;
		}
	}
	else if (pInputKeyboard->GetPress(DIK_RIGHT) == true)
	{// D�L�[�������ꂽ,�E�ړ�

		if (pInputKeyboard->GetPress(DIK_UP) == true)
		{// D+W,�E��ړ�

			pos.x += sinf(D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE;
			pos.z += cosf(D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE;
		}
		else if (pInputKeyboard->GetPress(DIK_DOWN) == true)
		{// D+S,�E���ړ�

			pos.x += sinf(D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE;
			pos.z += cosf(D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE;
		}
		else
		{// D,�E�ړ�

			pos.x += sinf(D3DX_PI * MOVE_LR + Camerarot.y) * MOVE;
			pos.z += cosf(D3DX_PI * MOVE_LR + Camerarot.y) * MOVE;
		}
	}
	else if (pInputKeyboard->GetPress(DIK_UP) == true)
	{// W�������ꂽ�A���ړ�

		pos.x += sinf(Camerarot.y) * MOVE;
		pos.z += cosf(Camerarot.y) * MOVE;
	}
	else if (pInputKeyboard->GetPress(DIK_DOWN) == true)
	{// S�������ꂽ�A��O�ړ�

		pos.x += sinf(D3DX_PI + Camerarot.y) * MOVE;
		pos.z += cosf(D3DX_PI + Camerarot.y) * MOVE;
	}

	if (pInputKeyboard->GetPress(DIK_A) == true)
	{// ���L�[�������ꂽ,���ړ�

		if (pInputKeyboard->GetPress(DIK_W) == true)
		{// A+W,����ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(-D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE_SLOW;
		}
		else if (pInputKeyboard->GetPress(DIK_S) == true)
		{// A+S,�����ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(-D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE_SLOW;
		}
		else
		{// A,���ړ�

			pos.x += sinf(-D3DX_PI * MOVE_LR + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(-D3DX_PI * MOVE_LR + Camerarot.y) * MOVE_SLOW;
		}
	}
	else if (pInputKeyboard->GetPress(DIK_D) == true)
	{// D�L�[�������ꂽ,�E�ړ�

		if (pInputKeyboard->GetPress(DIK_W) == true)
		{// D+W,�E��ړ�

			pos.x += sinf(D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(D3DX_PI * MOVE_LRDW + Camerarot.y) * MOVE_SLOW;
		}
		else if (pInputKeyboard->GetPress(DIK_S) == true)
		{// D+S,�E���ړ�

			pos.x += sinf(D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(D3DX_PI * MOVE_LRUP + Camerarot.y) * MOVE_SLOW;
		}
		else
		{// D,�E�ړ�

			pos.x += sinf(D3DX_PI * MOVE_LR + Camerarot.y) * MOVE_SLOW;
			pos.z += cosf(D3DX_PI * MOVE_LR + Camerarot.y) * MOVE_SLOW;
		}
	}
	else if (pInputKeyboard->GetPress(DIK_W) == true)
	{// W�������ꂽ�A���ړ�

		pos.x += sinf(Camerarot.y) * MOVE_SLOW;
		pos.z += cosf(Camerarot.y) * MOVE_SLOW;
	}
	else if (pInputKeyboard->GetPress(DIK_S) == true)
	{// S�������ꂽ�A��O�ړ�

		pos.x += sinf(D3DX_PI + Camerarot.y) * MOVE_SLOW;
		pos.z += cosf(D3DX_PI + Camerarot.y) * MOVE_SLOW;
	}

	if (pInputKeyboard->GetTrigger(DIK_LSHIFT) == true)
	{//��]

		//rot.y += D3DX_PI * 0.05f;
		rot.y += D3DXToRadian(5);
	}
	if (pInputKeyboard->GetTrigger(DIK_RSHIFT) == true)
	{// ��]

		//rot.y -= D3DX_PI * 0.05f;
		rot.y -= D3DXToRadian(5);
	}

	if (pInputKeyboard->GetPress(DIK_I) == true)
	{// I�L�[�������ꂽ,�㏸

		pos.y += MOVE;
	}
	else if (pInputKeyboard->GetPress(DIK_K) == true)
	{// K�L�[�������ꂽ,���~

		pos.y -= MOVE;
	}

	// �p�x���K��
	UtilFunc::Transformation::RotNormalize(rot.y);


	//// ���n�������ǂ���
	//bool bLand = false;

	//// �����擾
	//float fHeight = CGame::GetInstance()->GetElevation()->GetHeight(pos, bLand);

	//if (bLand == true)
	//{
	//	// �������
	//	pos.y = fHeight;
	//}
	//else
	//{
	//	pos.y = -100.0f;
	//}

	// �����ݒ�
	pObjX->SetRotation(rot);

	// �ʒu�ݒ�
	pObjX->SetPosition(pos);
}

//==========================================================================
// ��ޕύX
//==========================================================================
void CEdit::ChangeType()
{
	int nNumAll = MyMap::GetNumModelAll();

	// �L�[�{�[�h���擾
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	// �z�u����I�u�W�F�N�g�ύX
	if (pInputKeyboard->GetTrigger(DIK_1) == true)
	{// 1�������ꂽ

		// �F�̎�ލX�V
		m_nType = (m_nType + (nNumAll - 1)) % nNumAll;

		int nIdx = CXLoad::GetInstance()->XLoad(MyMap::GetModelFileName(m_nType));

		// �I�u�W�F�N�g���蓖��
		m_pObjX->BindXData(nIdx);
	}
	else if (pInputKeyboard->GetTrigger(DIK_2) == true)
	{// 2�������ꂽ

		// �F�̎�ލX�V
		m_nType = (m_nType + 1) % nNumAll;

		// �I�u�W�F�N�g���蓖��
		int nIdx = CXLoad::GetInstance()->XLoad(MyMap::GetModelFileName(m_nType));
		m_pObjX->BindXData(nIdx);
	}

	if (pInputKeyboard->GetTrigger(DIK_3) == true)
	{// 3�������ꂽ

		// �e�̎g�p�󋵐؂�ւ�
		m_bShadow = m_bShadow ? false : true;
	}

}

//==========================================================================
// ���f���͂�
//==========================================================================
void CEdit::GrabModel()
{
#if TOPCUR
	// �L�[�{�[�h���擾
	CInputKeyboard *pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();

	for (int nCntPriority = 0; nCntPriority < mylib_const::PRIORITY_NUM; nCntPriority++)
	{
		// �擪��ۑ�
		CObject *pObj = CObject::GetTop(nCntPriority);

		while (pObj != nullptr)
		{// nullptr������܂Ŗ������[�v

			// ���̃I�u�W�F�N�g���ꎞ�ۑ�
			CObject *pObjNext = pObj->GetNext();

			// ��ނ̎擾
			CObject::TYPE TargetType = pObj->GetType();

			if (TargetType != CObject::TYPE_XFILE || pObj == CObject::GetObjectX())
			{// �����Ɠ�����������

				// ���̃I�u�W�F�N�g����
				pObj = pObjNext;
				continue;
			}

			// �I�u�W�F�N�gX�̏��擾
			CObjectX *pObjX = pObj->GetObjectX();

			// �I�u�W�F�N�gX�̈ʒu�擾
			MyLib::Vector3 pObjPos = pObjX->GetPosition();

			// �I�u�W�F�N�gX�̌����擾
			MyLib::Vector3 pObjRot = pObjX->GetRotation();

			// �I�u�W�F�N�gX�̍ő�l�擾
			MyLib::Vector3 pObjVtxMax = pObjX->GetVtxMax();

			// �I�u�W�F�N�gX�̍ŏ��l�擾
			MyLib::Vector3 pObjVtxMin = pObjX->GetVtxMin();

			// �ʒu�擾
			MyLib::Vector3 pos = m_pObjX->GetPosition();

			// �ő�l�擾
			MyLib::Vector3 vtxMax = m_pObjX->GetVtxMax();

			// �ŏ��l�擾
			MyLib::Vector3 vtxMin = m_pObjX->GetVtxMin();

			if (pObjPos.x + pObjVtxMax.x >= pos.x + vtxMin.x &&	// �E����߂荞��ł�
				pObjPos.x + pObjVtxMin.x <= pos.x + vtxMax.x &&	// ������߂荞��ł�
				pObjPos.z + pObjVtxMax.z >= pos.z + vtxMin.z &&	// ����߂荞��ł�
				pObjPos.z + pObjVtxMin.z <= pos.z + vtxMax.z)	// �O����߂荞��ł�
			{// �����蔻����ɓ����Ă�����͂߂�

				if (pInputKeyboard->GetPress(DIK_SPACE) == true)
				{// SPACE�������ꂽ,����ňړ�

					// ���쏈��
					Control(pObjX);
				}

				if (pInputKeyboard->GetTrigger(DIK_DELETE) == true)
				{// Delete�������ꂽ�A�폜

					MyMap::Delete(pObjX);
					//DeleteEditModel(nCntModel);
				}
			}

			// ���̃I�u�W�F�N�g����
			pObj = pObjNext;
		}
	}
#endif
}

//==========================================================================
// ���f���폜
//==========================================================================
void CEdit::DeleteModel()
{

}

//==========================================================================
// �`�揈��
//==========================================================================
void CEdit::Draw()
{

}


//==========================================================================
// �O���e�L�X�g�ǂݍ��ݏ���
//==========================================================================
HRESULT CEdit::ReadText()
{
	return S_OK;;
}

//==========================================================================
// �����擾
//==========================================================================
int CEdit::GetNumAll()
{
	return m_nNumAll;
}