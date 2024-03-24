//=============================================================================
// 
//  �V�[������ [scene.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "scene.h"
#include "renderer.h"
#include "calculation.h"
#include "Xload.h"
#include "map.h"
#include "fade.h"
#include "elevation.h"
#include "player.h"
#include "camera.h"
#include "MyEffekseer.h"
#include "fog.h"

// �J�ڐ�
#include "game.h"
#include "title.h"
#include "result.h"
#include "ranking.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const char* MAP_TEXT = "data\\TEXT\\map\\info.txt";
	const char* ELEVATION_TEXT = "data\\TEXT\\elevation\\field_mountain.txt";
}

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================
CElevation *CScene::m_pObject3DMesh = nullptr;		// �I�u�W�F�N�g3D���b�V���̃I�u�W�F�N�g

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CScene::CScene()
{
	// �ϐ��̃N���A
	m_mode = MODE_TITLE;
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CScene::~CScene()
{

}

//==========================================================================
// ��������
//==========================================================================
CScene *CScene::Create(CScene::MODE mode)
{
	// �����p�̃I�u�W�F�N�g
	CScene *pScene = nullptr;

	if (pScene == nullptr)
	{// nullptr��������

		// ��������
		switch (mode)
		{
		case CScene::MODE_TITLE:
			pScene = CTitle::Create();
			break;

		case CScene::MODE_GAME:
		case CScene::MODE::MODE_GAMETUTORIAL:
			pScene = CGame::Create(mode);
			break;

		case CScene::MODE_RESULT:
			pScene = DEBUG_NEW CResult;
			break;

		case CScene::MODE_RANKING:
			pScene = DEBUG_NEW CRanking;
			break;
		}

		if (pScene != nullptr)
		{// �������̊m�ۂ��o���Ă�����

			// ���[�h�̐ݒ�
			pScene->m_mode = mode;
		}

		return pScene;
	}

	return nullptr;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CScene::Init()
{

	// �G�t�F�N�g�S�Ē�~
	CMyEffekseer::GetInstance()->StopAll();

	// �t�H�O���Z�b�g
	MyFog::ToggleFogFrag(false);

	//**********************************
	// �}�b�v�̐���
	//**********************************
	if (FAILED(MyMap::Create(MAP_TEXT)))
	{// ���s�����ꍇ
		return E_FAIL;
	}

	//**********************************
	// �N���̒n��
	//**********************************
	m_pObject3DMesh = CElevation::Create(ELEVATION_TEXT);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CScene::Uninit()
{

}

//==========================================================================
// �X�V����
//==========================================================================
void CScene::Update()
{
	
}

//==========================================================================
// �`�揈��
//==========================================================================
void CScene::Draw()
{
	
}

//==========================================================================
// �V�[���̃��Z�b�g
//==========================================================================
void CScene::ResetScene()
{
	//**********************************
	// �j���t�F�[�Y
	//**********************************
	// �N���̒n��
	if (m_pObject3DMesh != nullptr)
	{
		m_pObject3DMesh->Uninit();
		m_pObject3DMesh = nullptr;
	}

	// �}�b�v
	MyMap::Release();

	//**********************************
	// �����t�F�[�Y
	//**********************************
	// �}�b�v
	if (FAILED(MyMap::Create(MAP_TEXT)))
	{// ���s�����ꍇ
		return;
	}

	// �{�X�X�e�[�W�̋N������
	m_pObject3DMesh = CElevation::Create(ELEVATION_TEXT);
}

//==========================================================================
// ���݂̃��[�h�擾
//==========================================================================
CScene::MODE CScene::GetMode()
{
	return m_mode;
}

//==========================================================================
// 3D�I�u�W�F�N�g�̎擾
//==========================================================================
CElevation *CScene::GetElevation()
{
	return m_pObject3DMesh;
}