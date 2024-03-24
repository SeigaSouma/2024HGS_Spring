//=============================================================================
// 
//  �������� [multinumber.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "multinumber.h"
#include "number.h"
#include "manager.h"
#include "renderer.h"
#include "object2D.h"
#include "objectBillboard.h"
#include "texture.h"
#include "calculation.h"
#include "camera.h"

//==========================================================================
// �}�N����`
//==========================================================================
#define TEXTURE			"data\\TEXTURE\\number_blackclover_01.png"	// �e�N�X�`���̃t�@�C��
#define TEX_U			(0.1f)							// U�̕���

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CMultiNumber::CMultiNumber(int nPriority)
{
	// �l�̃N���A
	m_nNum = 0;				// ����
	m_nNumNumber = 0;		// �����̐�
	m_nTexIdx = 0;			// �e�N�X�`���̃C���f�b�N�X�ԍ�
	m_nPriority = 0;		// �D�揇��
	m_ppMultiNumber = nullptr;	// �����̃I�u�W�F�N�g
	m_pos = MyLib::Vector3(0.0f, 0.0f, 0.0f);	// �ʒu
	m_rot = MyLib::Vector3(0.0f, 0.0f, 0.0f);	// �ʒu
	m_col = mylib_const::DEFAULT_COLOR;		// �F
	m_size = D3DXVECTOR2(0.0f, 0.0f);	// �����̃T�C�Y
	m_objType = CNumber::OBJECTTYPE_2D;	// �I�u�W�F�N�g�̎��
	m_bDigitDraw = false;				// �����`��
	m_fKerning = 0.0f;				// �����Ԋu
	m_Alignment = AlignmentType::ALIGNMENT_LEFT;		// ����
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CMultiNumber::~CMultiNumber()
{

}

//==========================================================================
// ��������
//==========================================================================
CMultiNumber *CMultiNumber::Create(MyLib::Vector3 pos, D3DXVECTOR2 size, int nNum, CNumber::EObjectType objtype, bool bDigitDraw, int nPriority)
{
	// �����p�̃I�u�W�F�N�g
	CMultiNumber *pNumber = nullptr;

	if (pNumber == nullptr)
	{// nullptr��������

	 // �������̊m��
		pNumber = DEBUG_NEW CMultiNumber;

		if (pNumber != nullptr)
		{// �������̊m�ۂ��o���Ă�����

			// �I�u�W�F�N�g�̎��
			pNumber->m_objType = objtype;

			// �T�C�Y
			pNumber->m_size = size;

			// �ʒu
			pNumber->m_pos = pos;

			// �����̐�
			pNumber->m_nNumNumber = nNum;

			// �����`��
			pNumber->m_bDigitDraw = bDigitDraw;

			// �D�揇��
			pNumber->m_nPriority = nPriority;

			// ����������
			pNumber->Init();
		}
		else
		{
			delete pNumber;
			pNumber = nullptr;
		}

		return pNumber;
	}

	return nullptr;
}


//==========================================================================
// ��������(�I�[�o�[���[�h)
//==========================================================================
CMultiNumber *CMultiNumber::Create(MyLib::Vector3 pos, D3DXVECTOR2 size, int nNum, CNumber::EObjectType objtype, const char *pTextureFile, bool bDigitDraw, int nPriority)
{
	// �����p�̃I�u�W�F�N�g
	CMultiNumber *pNumber = nullptr;

	if (pNumber == nullptr)
	{// nullptr��������

	 // �������̊m��
		pNumber = DEBUG_NEW CMultiNumber;

		if (pNumber != nullptr)
		{// �������̊m�ۂ��o���Ă�����

		 // �I�u�W�F�N�g�̎��
			pNumber->m_objType = objtype;

			// �T�C�Y
			pNumber->m_size = size;

			// �ʒu
			pNumber->m_pos = pos;
			pNumber->SetPosition(pos);

			// �����̐�
			pNumber->m_nNumNumber = nNum;

			// �����`��
			pNumber->m_bDigitDraw = bDigitDraw;

			// �D�揇��
			pNumber->m_nPriority = nPriority;

			// �e�N�X�`���ǂݍ���
			pNumber->m_nTexIdx = CTexture::GetInstance()->Regist(pTextureFile);

			// ����������
			pNumber->Init();
		}
		else
		{
			delete pNumber;
			pNumber = nullptr;
		}

		return pNumber;
	}

	return nullptr;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CMultiNumber::Init()
{
	// �����������m��
	m_ppMultiNumber = DEBUG_NEW(CNumber*[m_nNumNumber]);

	// ��������
	if (m_nTexIdx == 0)
	{
		m_nTexIdx = CTexture::GetInstance()->Regist(TEXTURE);
	}

	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		// ��������
		m_ppMultiNumber[nCntNum] = CNumber::Create(m_objType, m_nPriority);

		// �e��ϐ��̏�����
		m_ppMultiNumber[nCntNum]->SetSize(m_size);	// �T�C�Y
		m_ppMultiNumber[nCntNum]->SetPosition(MyLib::Vector3(m_pos.x + m_size.y * nCntNum, m_pos.y, m_pos.z));	// �ʒu

																											// ��ނ̐ݒ�
		if (m_objType == CNumber::OBJECTTYPE_3D)
		{
			m_ppMultiNumber[nCntNum]->SetType(CObject::TYPE_OBJECT3D);
			m_ppMultiNumber[nCntNum]->SetSize3D(MyLib::Vector3(m_size.x, m_size.y, 0.0f));
			m_ppMultiNumber[nCntNum]->SetRotation(m_rot);
		}
		else
		{
			m_ppMultiNumber[nCntNum]->SetType(CObject::TYPE_OBJECT2D);
		}

		// �e�N�X�`���̊��蓖��
		m_ppMultiNumber[nCntNum]->BindTexture(m_nTexIdx);
	}

	if (m_bDigitDraw)
	{
		// �`��ݒ�
		SettingDisp();
	}

	if (m_objType == CNumber::OBJECTTYPE_BILLBOARD)
	{
		// �J�����̌����擾
		MyLib::Vector3 camerarot = CManager::GetInstance()->GetCamera()->GetRotation();

		SetRotation(MyLib::Vector3(0.0f, camerarot.y, 0.0f));
	}

	// �����Ԋu
	m_fKerning = m_size.y;

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CMultiNumber::Uninit()
{
	// �I������
	if (m_ppMultiNumber != nullptr)
	{

	 // �e�����I�u�W�F�N�g�̔j��
		for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
		{
			if (m_ppMultiNumber[nCntNum] != nullptr)
			{
				m_ppMultiNumber[nCntNum]->Uninit();
				delete m_ppMultiNumber[nCntNum];
				m_ppMultiNumber[nCntNum] = nullptr;
			}
		}
		delete[] m_ppMultiNumber;
		m_ppMultiNumber = nullptr;
	}

	delete this;
}

//==========================================================================
// �������
//==========================================================================
void CMultiNumber::Release()
{
	// �I������
	if (m_ppMultiNumber != nullptr)
	{

	 // �e�����I�u�W�F�N�g�̔j��
		for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
		{
			if (m_ppMultiNumber[nCntNum] != nullptr)
			{
				m_ppMultiNumber[nCntNum]->Release();
				delete m_ppMultiNumber[nCntNum];
				m_ppMultiNumber[nCntNum] = nullptr;
			}
		}
		delete m_ppMultiNumber;
		m_ppMultiNumber = nullptr;
	}
	delete this;
}

//==========================================================================
// �X�V����
//==========================================================================
void CMultiNumber::Update()
{
	if (m_bDigitDraw == false)
	{// �����`�悶��Ȃ��ꍇ
		return;
	}

	if (m_objType == CNumber::OBJECTTYPE_BILLBOARD)
	{
		// �J�����̌����擾
		MyLib::Vector3 camerarot = CManager::GetInstance()->GetCamera()->GetRotation();

		SetRotation(MyLib::Vector3(0.0f, camerarot.y, 0.0f));
	}

	SettingDisp();
}

//==========================================================================
// �`��ݒ�
//==========================================================================
void CMultiNumber::SettingDisp()
{
	int nNumberDigit = UtilFunc::Calculation::GetDigit(m_nNum);

	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		if (m_ppMultiNumber[nCntNum] == nullptr)
		{
			continue;
		}

		switch (m_objType)
		{
		case CNumber::OBJECTTYPE_2D:
			if (m_nNumNumber - nNumberDigit <= nCntNum)
			{// ����
				m_ppMultiNumber[nCntNum]->GetObject2D()->SetEnableDisp(true);
			}
			else
			{
				m_ppMultiNumber[nCntNum]->GetObject2D()->SetEnableDisp(false);
			}
			break;

		case CNumber::OBJECTTYPE_3D:
			if (m_nNumNumber - nNumberDigit <= nCntNum)
			{// ����
				m_ppMultiNumber[nCntNum]->GetObject3D()->SetEnableDisp(true);
			}
			else
			{
				m_ppMultiNumber[nCntNum]->GetObject3D()->SetEnableDisp(false);
			}
			break;

		case CNumber::OBJECTTYPE_BILLBOARD:
			if (m_nNumNumber - nNumberDigit <= nCntNum)
			{// ����
				m_ppMultiNumber[nCntNum]->GetObjectBillboard()->SetEnableDisp(true);
			}
			else
			{
				m_ppMultiNumber[nCntNum]->GetObjectBillboard()->SetEnableDisp(false);
			}
			break;
		}
	}
}

//==========================================================================
// �`�揈��
//==========================================================================
void CMultiNumber::Draw()
{
	int nNumNumber = m_nNumNumber;
	if (m_bDigitDraw == true)
	{// �����`�悾������
		nNumNumber = UtilFunc::Calculation::GetDigit(m_nNum);
	}
}

//==========================================================================
// �l�̐ݒ菈��
//==========================================================================
void CMultiNumber::AddNumber(int nValue)
{
	m_nNum += nValue;

	// �l�̐ݒ菈��
	SetValue();
}

//==========================================================================
// �l�̐ݒ菈��
//==========================================================================
void CMultiNumber::SetValue(int nValue)
{
	m_nNum = nValue;

	// �l�̐ݒ菈��
	SetValue();
}

//==========================================================================
// �l�̎擾����
//==========================================================================
int CMultiNumber::GetValue()
{
	return m_nNum;
}

//==========================================================================
// �l�̐ݒ菈��
//==========================================================================
void CMultiNumber::SetValue()
{
	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		if (m_ppMultiNumber[nCntNum] == nullptr)
		{
			continue;
		}

		int aTexU = m_nNum % (int)std::pow(10, m_nNumNumber + 1 - nCntNum) / ((int)std::pow(10, m_nNumNumber - nCntNum) / 10);

		if (aTexU < 0)
		{
			aTexU = 0;
		}

		// �e�N�X�`���|�C���^�擾
		D3DXVECTOR2 *pTex = m_ppMultiNumber[nCntNum]->GetTex();

		// �e�N�X�`�����W�̐ݒ�
		pTex[0] = D3DXVECTOR2(aTexU * TEX_U, 0.0f);
		pTex[1] = D3DXVECTOR2(aTexU * TEX_U + TEX_U, 0.0f);
		pTex[2] = D3DXVECTOR2(aTexU * TEX_U, 1.0f);
		pTex[3] = D3DXVECTOR2(aTexU * TEX_U + TEX_U, 1.0f);

		// ���_�ݒ�
		m_ppMultiNumber[nCntNum]->SetVtx();
	}
}

//==========================================================================
// �ʒu�ݒ�
//==========================================================================
void CMultiNumber::SetPosition(const MyLib::Vector3 pos)
{
	// �ʒu�ݒ�
	m_pos = pos;

	int nNumberDigit = UtilFunc::Calculation::GetDigit(m_nNum);
	if (m_Alignment == AlignmentType::ALIGNMENT_LEFT)
	{
		if (!m_bDigitDraw)
		{
			nNumberDigit = m_nNumNumber;
		}

		MyLib::Vector3 setpos = m_pos;
		if (m_bDigitDraw)
		{
			for (int i = 0; i < m_nNumNumber - nNumberDigit; i++)
			{
				setpos.x -= sinf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;
				setpos.z -= cosf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;
			}
		}

		for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
		{
			if (m_ppMultiNumber[nCntNum] != nullptr)
			{
				m_ppMultiNumber[nCntNum]->SetPosition(MyLib::Vector3
				(
					setpos.x + sinf(D3DX_PI * 0.5f + m_rot.y) * (m_fKerning * nCntNum),
					setpos.y,
					setpos.z + cosf(D3DX_PI * 0.5f + m_rot.y) * (m_fKerning * nCntNum))
				);	// �ʒu
			}
		}
	}
	else if (m_Alignment == AlignmentType::ALIGNMENT_RIGHT)
	{
		MyLib::Vector3 setpos = m_pos;
		for (int i = 0; i < m_nNumNumber; i++)
		{
			setpos.x -= sinf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;
			setpos.z -= cosf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;
		}

		for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
		{
			if (m_ppMultiNumber[nCntNum] != nullptr)
			{
				setpos.x += sinf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;
				setpos.z += cosf(D3DX_PI * 0.5f + m_rot.y) * m_fKerning;

				m_ppMultiNumber[nCntNum]->SetPosition(setpos);	// �ʒu
			}
		}
	}
}

//==========================================================================
// �ʒu�擾
//==========================================================================
MyLib::Vector3 CMultiNumber::GetPosition() const
{
	return m_pos;
}

//==========================================================================
// �ʒu�ݒ�
//==========================================================================
void CMultiNumber::SetOriginPosition(const MyLib::Vector3 pos)
{
	m_posOrigin = pos;
}

//==========================================================================
// �ʒu�擾
//==========================================================================
MyLib::Vector3 CMultiNumber::GetOriginPosition() const
{
	return m_posOrigin;
}

//==========================================================================
// �����ݒ�
//==========================================================================
void CMultiNumber::SetRotation(const MyLib::Vector3 rot)
{
	m_rot = rot;
	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		if (m_ppMultiNumber[nCntNum] != nullptr)
		{
			m_ppMultiNumber[nCntNum]->SetRotation(rot);	// �ʒu
		}
	}
}

//==========================================================================
// �����擾
//==========================================================================
MyLib::Vector3 CMultiNumber::GetRotation() const
{
	return m_rot;
}

//==========================================================================
// �F�ݒ�
//==========================================================================
void CMultiNumber::SetColor(const D3DXCOLOR col)
{
	m_col = col;

	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		if (m_ppMultiNumber[nCntNum] != nullptr)
		{
			m_ppMultiNumber[nCntNum]->SetColor(m_col);	// �F
		}
	}
}

//==========================================================================
// �F�擾
//==========================================================================
D3DXCOLOR CMultiNumber::GetColor() const
{
	return m_col;
}

//==========================================================================
// �T�C�Y�ݒ�
//==========================================================================
void CMultiNumber::SetSize(const D3DXVECTOR2 size)
{
	m_size = size;

	for (int nCntNum = 0; nCntNum < m_nNumNumber; nCntNum++)
	{
		if (m_ppMultiNumber[nCntNum] != nullptr)
		{
			m_ppMultiNumber[nCntNum]->SetSize(m_size);
		}
	}
}

//==========================================================================
// �T�C�Y�擾
//==========================================================================
D3DXVECTOR2 CMultiNumber::GetSize() const
{
	return m_size;
}

//==========================================================================
// �T�C�Y�ݒ�
//==========================================================================
void CMultiNumber::SetSizeOrigin(const D3DXVECTOR2 size)
{
	m_sizeOrigin = size;
}

//==========================================================================
// �T�C�Y�擾
//==========================================================================
D3DXVECTOR2 CMultiNumber::GetSizeOrigin() const
{
	return m_sizeOrigin;
}

//==========================================================================
// �����Ԋu�ݒ�
//==========================================================================
void CMultiNumber::SetKerning(float kerning)
{
	m_fKerning = kerning;
}