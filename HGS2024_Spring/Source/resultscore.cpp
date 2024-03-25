//=============================================================================
// 
//  �X�R�A���� [resultscore.cpp]
//  Author : ���c����
// 
//=============================================================================
#include "resultscore.h"
#include "manager.h"
#include "calculation.h"
#include "input.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const char* TEXTURE_NUMBER = "data\\TEXTURE\\number\\number_oradano.png";		// �����̃e�N�X�`��
	const D3DXVECTOR2 SCORESIZE = D3DXVECTOR2(40.0f, 40.0f);
}

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CResultScore::CResultScore(int nPriority) : CObject(nPriority)
{
	m_pScore = nullptr;
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CResultScore::~CResultScore()
{

}

//==========================================================================
// ��������
//==========================================================================
CResultScore* CResultScore::Create()
{
	// �������̊m��
	CResultScore* pMarker = DEBUG_NEW CResultScore;

	if (pMarker != nullptr)
	{
		// ����������
		pMarker->Init();
	}

	return pMarker;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CResultScore::Init()
{
	// ��������
	CreateScore();		// ��_���[�W����
	
	CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL::LABEL_SE_BATTLERESULT);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CResultScore::Uninit()
{
	if (m_pScore != nullptr)
	{
		m_pScore->Uninit();
		m_pScore = nullptr;
	}
}

//==========================================================================
// �폜
//==========================================================================
void CResultScore::Kill()
{
	if (m_pScore != nullptr)
	{
		m_pScore->Release();
		m_pScore = nullptr;
	}
}

//==========================================================================
// �X�V����
//==========================================================================
void CResultScore::Update()
{
	m_pScore->Update();
}

//==========================================================================
// ���S�񐔐���
//==========================================================================
void CResultScore::CreateScore()
{
	// ����̕]�����擾

	m_pScore = CMultiNumber::Create(
		MyLib::Vector3(SCREEN_HEIGHT * 0.5f, SCREEN_WIDTH * 0.5f, 0.0f),
		SCORESIZE,
		5,
		CNumber::EObjectType::OBJECTTYPE_2D,
		true, GetPriority());
	if (m_pScore == nullptr)
	{
		return;
	}

	// �E�񂹂ɐݒ�
	m_pScore->SetAlignmentType(CMultiNumber::AlignmentType::ALIGNMENT_RIGHT);

	// �F�ݒ�
	m_pScore->SetColor(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
}

//==========================================================================
// �`�揈��
//==========================================================================
void CResultScore::Draw()
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// �A���t�@�e�X�g��L���ɂ���
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// �I�u�W�F�N�g2D�̕`��
	m_pScore->Draw();

	// �A���t�@�e�X�g�𖳌��ɂ���
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_ALWAYS);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);
}
