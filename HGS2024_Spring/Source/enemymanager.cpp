//=============================================================================
// 
//  �G�̃}�l�[�W������ [enemymanager.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "debugproc.h"
#include "enemymanager.h"
#include "calculation.h"
#include "manager.h"
#include "game.h"
#include "gamemanager.h"
#include "renderer.h"
#include "enemy.h"
#include "enemy_boss.h"
#include "particle.h"
#include "fade.h"
#include "elevation.h"
#include "player.h"
#include "impactwave.h"
#include "camera.h"
#include "sound.h"
#include "enemybase.h"
#include "instantfade.h"
#include "timer.h"

//==========================================================================
// �ÓI�����o�ϐ��錾
//==========================================================================

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CEnemyManager::CEnemyManager()
{
	// �l�̃N���A
	m_pBoss = nullptr;										// �{�X
	memset(&m_aPattern[0], 0, sizeof(m_aPattern));	// �z�u�̎��
	m_state = STATE_NONE;	// ���
	m_nPatternNum = 0;		// �o���p�^�[����
	m_nNumChara = 0;		// �G�̎�ނ̑���
	m_bChangeStage = false;	// �X�e�[�W�ύX����
}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CEnemyManager::~CEnemyManager()
{

}

//==========================================================================
// ��������
//==========================================================================
CEnemyManager *CEnemyManager::Create(const std::string pTextFile)
{
	// �����p�̃I�u�W�F�N�g
	CEnemyManager *pModel = nullptr;

	if (pModel == nullptr)
	{// nullptr��������

		// �������̊m��
		pModel = DEBUG_NEW CEnemyManager;

		if (pModel != nullptr)
		{// �������̊m�ۂ��o���Ă�����

			// ����������
			HRESULT hr = pModel->ReadText(pTextFile);
			if (FAILED(hr))
			{// ���s���Ă�����
				return nullptr;
			}

			// ����������
			hr = pModel->Init();

			if (FAILED(hr))
			{// ���s���Ă�����
				pModel->Uninit();
				pModel = nullptr;
				return nullptr;
			}
		}

		return pModel;
	}

	return nullptr;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CEnemyManager::Init()
{

	// �X�e�[�W�ύX���ɂ���
	m_bChangeStage = false;

	// �ύX������Ȃ�����
	SetEnableChangeStage(true);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CEnemyManager::Uninit()
{
	
}

//==========================================================================
// �X�V����
//==========================================================================
void CEnemyManager::Update()
{
	int nNumAll = CEnemy::GetNumSurvival();
	if (nNumAll <= 0 && !m_bChangeStage)
	{// �S���|���ꂽ��

		// �X�e�[�W�ύX���ɂ���
		m_bChangeStage = true;

		// �ʏ�N���A��Ԃɂ���
		CGame::GetInstance()->GetGameManager()->SetType(CGameManager::SceneType::SCENE_MAINRESULT);
		CGame::GetInstance()->GetGameManager()->GameResultSettings();
	}

	// �e�L�X�g�̕`��
	CManager::GetInstance()->GetDebugProc()->Print(
		"---------------- �G��� ----------------\n"
		"�y�c��l���z[%d], �y�p�^�[�����z[%d]\n", nNumAll, m_nPatternNum);
}

//==========================================================================
// �X�e�[�W���̓G�z�u
//==========================================================================
void CEnemyManager::SetStageEnemy()
{
	// �Q�[���}�l�[�W���擾
	CGameManager* pGameManager = CGame::GetInstance()->GetGameManager();

	if (pGameManager == nullptr)
	{
		return;
	}

	if (pGameManager->IsEndNormalStage() == true)
	{
		return;
	}

	// �X�e�[�W�̑����擾
	int nNumStage = pGameManager->GetNumStage();
	int nNowStage = pGameManager->GetNowStage();

	if (nNumStage <= nNowStage)
	{
		return;
	}

	// �G���_�f�[�^�擾
	CEnemyBase* pEnemyBase = CGame::GetInstance()->GetEnemyBase();
	if (pEnemyBase == nullptr)
	{
		return;
	}

	// ���_�̐��擾
	int nNumBase = pEnemyBase->GetNumBase(nNowStage);

	for (int i = 0; i < nNumBase; i++)
	{
		// ���_���Ƃ̃f�[�^�擾
		CEnemyBase::sInfo sEnemyBaseInfo = pEnemyBase->GetEnemyBaseInfo(nNowStage, i);

		// �G�̔z�u
		SetEnemy(sEnemyBaseInfo.pos, sEnemyBaseInfo.rot, sEnemyBaseInfo.nPattern);
	}

	// �X�e�[�W���Z
	//pGameManager->AddNowStage();
}

//==========================================================================
// �{�X�X�e�[�W�̓G�z�u
//==========================================================================
void CEnemyManager::SetStageBoss()
{
	// �G���_�f�[�^�擾
	CEnemyBase *pEnemyBase = CGame::GetInstance()->GetEnemyBase();
	if (pEnemyBase == nullptr)
	{
		return;
	}

	// ���_�̐��擾
	int nNumBase = pEnemyBase->GetNumBase(0);

	for (int i = 0; i < nNumBase; i++)
	{
		// ���_���Ƃ̃f�[�^�擾
		CEnemyBase::sInfo sEnemyBaseInfo = pEnemyBase->GetEnemyBaseInfo(0, i);

		// �G�̔z�u
		SetEnemy(sEnemyBaseInfo.pos, sEnemyBaseInfo.rot, sEnemyBaseInfo.nPattern);
	}
}

//==========================================================================
// �G�z�u
//==========================================================================
CEnemy **CEnemyManager::SetEnemy(MyLib::Vector3 pos, MyLib::Vector3 rot, int nPattern)
{
	int nNumSpawn = m_aPattern[nPattern].nNumEnemy;	// �X�|�[�����鐔
	int nCntStart = 0;
	Pattern NowPattern = m_aPattern[nPattern];
	CEnemy *pEnemy[mylib_const::MAX_PATTEN_ENEMY];
	memset(&pEnemy[0], 0, sizeof(pEnemy));

	for (int nCntEnemy = 0; nCntEnemy < nNumSpawn; nCntEnemy++)
	{
		int nType = NowPattern.EnemyData[nCntEnemy].nType;

		// �v�Z�p�}�g���b�N�X
		D3DXMATRIX mtxRot, mtxTrans, mtxWorld;

		// �}�g���b�N�X�̏�����
		D3DXMatrixIdentity(&mtxWorld);

		// �G���_�̌����𔽉f����
		D3DXMatrixRotationYawPitchRoll(&mtxRot, rot.y, rot.x, rot.z);
		D3DXMatrixMultiply(&mtxWorld, &mtxWorld, &mtxRot);

		// �p�^�[�����̈ʒu�𔽉f����
		D3DXMatrixTranslation(&mtxTrans, NowPattern.EnemyData[nCntEnemy].pos.x, NowPattern.EnemyData[nCntEnemy].pos.y, NowPattern.EnemyData[nCntEnemy].pos.z);
		D3DXMatrixMultiply(&mtxWorld, &mtxWorld, &mtxTrans);

		// �X�|�[�����̌������|�����킹��
		MyLib::Vector3 spawnPos = MyLib::Vector3(mtxWorld._41, mtxWorld._42, mtxWorld._43);

		// ���_�̈ʒu�����Z
		spawnPos += pos;

		// �G�̐���
		pEnemy[nCntEnemy] = CEnemy::Create(
			sMotionFileName[nType].c_str(),	// �t�@�C����
			spawnPos,						// �ʒu
			(CEnemy::TYPE)nType);			// ���

		if (pEnemy[nCntEnemy] == nullptr)
		{// ���s���Ă�����

			delete pEnemy[nCntEnemy];
			pEnemy[nCntEnemy] = nullptr;
			break;
		}

		// �{�X�̏ꍇ�R�s�[
		if (nType == 0 && m_pBoss == nullptr)
		{
			m_pBoss = (CEnemyBoss*)pEnemy[nCntEnemy];
		}

		// �����ݒ�
		pEnemy[nCntEnemy]->SetRotation(rot);
		pEnemy[nCntEnemy]->SetRotDest(rot.y);
	}

	return &pEnemy[0];
}

//==========================================================================
// �p�^�[����
//==========================================================================
int CEnemyManager::GetPatternNum()
{
	return m_nPatternNum;
}

//==========================================================================
// �p�^�[���擾
//==========================================================================
CEnemyManager::Pattern CEnemyManager::GetPattern(int nPattern)
{
	return m_aPattern[nPattern];
}

//==========================================================================
// �e�L�X�g�ǂݍ��ݏ���
//==========================================================================
HRESULT CEnemyManager::ReadText(const std::string pTextFile)
{

	FILE *pFile = nullptr;	// �t�@�C���|�C���^��錾

	// �t�@�C�����J��
	pFile = fopen(pTextFile.c_str(), "r");
	if (pFile == nullptr)
	{//�t�@�C�����J�����ꍇ
		return E_FAIL;
	}

	char aComment[MAX_COMMENT];	// �R�����g
	int nType = 0;				// �z�u������
	int nCntPatten = 0;			// �p�^�[���̃J�E���g
	int nCntFileName = 0;

	memset(&m_aPattern[0], 0, sizeof(m_aPattern));	// �ǂݍ��݃f�[�^
	m_nNumChara = 0;

	while (1)
	{// END_SCRIPT������܂ŌJ��Ԃ�

		// ������̓ǂݍ���
		fscanf(pFile, "%s", &aComment[0]);

		// �L�����N�^�[���̐ݒ�
		if (strcmp(aComment, "NUM_CHARACTER") == 0)
		{// NUM_CHARACTER��������

			fscanf(pFile, "%s", &aComment[0]);	// =�̕�
			fscanf(pFile, "%d", &m_nNumChara);	// �L�����N�^�[��
		}

		while (nCntFileName != m_nNumChara)
		{// ���f���̐����ǂݍ��ނ܂ŌJ��Ԃ�

			// ������̓ǂݍ���
			fscanf(pFile, "%s", &aComment[0]);

			// ���f�����̐ݒ�
			if (strcmp(aComment, "MOTION_FILENAME") == 0)
			{// NUM_MODEL��������

				fscanf(pFile, "%s", &aComment[0]);	// =�̕�
				fscanf(pFile, "%s", &aComment[0]);	// �t�@�C����

				// �t�@�C�����ۑ�
				sMotionFileName[nCntFileName] = aComment;

				nCntFileName++;	// �t�@�C�������Z
			}
		}

		// �e�p�^�[���̐ݒ�
		if (strcmp(aComment, "PATTERNSET") == 0)
		{// �z�u���̓ǂݍ��݂��J�n

			int nCntEnemy = 0;			// �G�̔z�u�J�E���g

			while (strcmp(aComment, "END_PATTERNSET") != 0)
			{// END_PATTERNSET������܂ŌJ��Ԃ�

				fscanf(pFile, "%s", &aComment[0]);	//�m�F����

				if (strcmp(aComment, "FIXEDMOVE") == 0)
				{// FIXEDMOVE����������̓����̎�ޓǂݍ���

					fscanf(pFile, "%s", &aComment[0]);	// =�̕�
					fscanf(pFile, "%d", &m_aPattern[nCntPatten].nFixedType);	// ���̓����̎��
				}

				if (strcmp(aComment, "ENEMYSET") == 0)
				{// ENEMYSET�œG���̓ǂݍ��݊J�n

					while (strcmp(aComment, "END_ENEMYSET") != 0)
					{// END_ENEMYSET������܂ŌJ��Ԃ�

						fscanf(pFile, "%s", &aComment[0]);	// �m�F����

						if (strcmp(aComment, "TYPE") == 0)
						{// TYPE��������L�����t�@�C���ԍ��ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);	// =�̕�
							fscanf(pFile, "%d", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].nType);	// �L�����t�@�C���ԍ�
						}

						if (strcmp(aComment, "POS") == 0)
						{// POS��������ʒu�ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);		// =�̕�
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.x);	// X���W
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.y);	// Y���W
							fscanf(pFile, "%f", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].pos.z);	// Z���W
						}

						if (strcmp(aComment, "STARTFRAME") == 0)
						{// STARTFRAME�������珉���t���[���ǂݍ���

							fscanf(pFile, "%s", &aComment[0]);	// =�̕�
							fscanf(pFile, "%d", &m_aPattern[nCntPatten].EnemyData[nCntEnemy].nStartFrame);	// �����t���[��
						}

					}// END_ENEMYSET�̂�����

					nCntEnemy++;	// �G�̃J�E���g�����Z
					m_aPattern[nCntPatten].nNumEnemy++;	// �G�̃J�E���g�����Z
				}
			}// END_PATTERNSET�̂�����

			nCntPatten++;	// �p�^�[�����Z
		}

		if (strcmp(aComment, "END_SCRIPT") == 0)
		{// �I�������Ń��[�v�𔲂���
			break;
		}
	}

	// �p�^�[����
	m_nPatternNum = nCntPatten;

	// �t�@�C�������
	fclose(pFile);

	return S_OK;
}

//==========================================================================
// �{�X�擾
//==========================================================================
CEnemyBoss *CEnemyManager::GetBoss()
{
	return m_pBoss;
}

//==========================================================================
// �G�̃��[�V�����t�@�C�����擾
//==========================================================================
const char *CEnemyManager::GetMotionFilename(int nType)
{
	return &sMotionFileName[nType][0];
}