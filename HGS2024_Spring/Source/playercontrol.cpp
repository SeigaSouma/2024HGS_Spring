//=============================================================================
// 
//  �v���C���[�R���g���[������ [playercontrol.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "playercontrol.h"
#include "manager.h"
#include "calculation.h"
#include "input.h"
#include "camera.h"
#include "enemy.h"

namespace
{
	const float STAMINA_AVOID = 30.0f;	// ����̃X�^�~�i�����
	const float LENGTH_AUTOFACE = 200.0f;	// �����Ō�������
}

//==========================================================================
// �U���\�t���O�擾
//==========================================================================
bool CPlayerControlAttack::IsAttack(CPlayer* player)
{
	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();

	if ((pMotion->IsGetCombiable() || pMotion->IsGetCancelable()) &&
		!player->IsJump())
	{
		return true;
	}
	return false;
}

//==========================================================================
// �ʏ�U��
//==========================================================================
void CPlayerControlAttack::Attack(CPlayer* player)
{
	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();
	int nMotionType = pMotion->GetType();

	// �ڕW�̌����擾
	float fRotDest = player->GetRotDest();

	// �J�����̌����擾
	CCamera* pCamera = CManager::GetInstance()->GetCamera();
	MyLib::Vector3 Camerarot = pCamera->GetRotation();

	MyLib::Vector3 pos = player->GetPosition();

	// �\��t���O�I�t
	m_bAttackReserved = false;

	// �U��
	if (IsAttack(player) &&
		!pInputGamepad->GetPress(CInputGamepad::BUTTON_RB, player->GetMyPlayerIdx()) &&
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON_X, player->GetMyPlayerIdx()))
	{
		int combostage = player->GetComboStage();
		if (combostage == 0 || player->IsAttacking())
		{
			m_bAttackReserved = true;
		}

		if (pInputGamepad->IsTipStick())
		{// ���X�e�B�b�N���|��Ă�ꍇ
			fRotDest = D3DX_PI + pInputGamepad->GetStickRotL(player->GetMyPlayerIdx()) + Camerarot.y;
		}

		// �G�m�F
		CListManager<CEnemy> enemyList = CEnemy::GetListObj();
		CEnemy* pEnemy = nullptr;
		while (enemyList.ListLoop(&pEnemy))
		{
			MyLib::Vector3 enemypos = pEnemy->GetPosition();
			if (UtilFunc::Collision::CollisionViewRange3D(pos, enemypos, fRotDest, 150.0f) &&
				UtilFunc::Collision::CircleRange3D(pos, enemypos, LENGTH_AUTOFACE, pEnemy->GetRadius()))
			{
				fRotDest = pos.AngleXZ(enemypos);
				break;
			}
		}

		if (player->IsReadyDashAtk() && combostage == 0)
		{// �_�b�V�����̏�����2����X�^�[�g
			combostage++;
			player->SetComboStage(combostage);

			pMotion->Set(CPlayer::MOTION_DASHATK, true);
		}
		else
		{
			// �R���{�i�K���l��
			int nSetType = CPlayer::MOTION_ATK + combostage;
			pMotion->Set(nSetType, true);
		}
		player->SetComboStage(combostage);

		// �i�K�ʃ��Z�b�g����
		StageByReset(player);
	}

	// �ڕW�̌����ݒ�
	player->SetRotDest(fRotDest);
}

//==========================================================================
// �ʏ�U��
//==========================================================================
void CPlayerControlAttack_Level1::Attack(CPlayer* player)
{
	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();
	int nMotionType = pMotion->GetType();

	// �J�����̌����擾
	CCamera* pCamera = CManager::GetInstance()->GetCamera();
	MyLib::Vector3 Camerarot = pCamera->GetRotation();

	if (!m_bChargePossible)
	{
		CPlayerControlAttack::Attack(player);
	}

	// ���擾
	float fRotDest = player->GetRotDest();
	MyLib::Vector3 pos = player->GetPosition();

	if (IsAttack(player) &&
		pInputGamepad->GetPress(CInputGamepad::BUTTON_Y, player->GetMyPlayerIdx()))
	{
		if (pInputGamepad->IsTipStick())
		{// ���X�e�B�b�N���|��Ă�ꍇ
			fRotDest = D3DX_PI + pInputGamepad->GetStickRotL(player->GetMyPlayerIdx()) + Camerarot.y;
		}

		// �G�m�F
		CListManager<CEnemy> enemyList = CEnemy::GetListObj();
		CEnemy* pEnemy = nullptr;
		while (enemyList.ListLoop(&pEnemy))
		{
			MyLib::Vector3 enemypos = pEnemy->GetPosition();
			if (UtilFunc::Collision::CollisionViewRange3D(pos, enemypos, fRotDest, 150.0f) &&
				UtilFunc::Collision::CircleRange3D(pos, enemypos, LENGTH_AUTOFACE, pEnemy->GetRadius()))
			{
				fRotDest = pos.AngleXZ(enemypos);
				break;
			}
		}

		// �R���{�i�K���l��
		int nSetType = CPlayer::MOTION_ATK4;
		pMotion->Set(CPlayer::MOTION_ATK4);

		// �i�K�ʃ��Z�b�g����
		player->SetComboStage(0);
		m_bChargePossible = false;
	}

	// �ڕW�̌����ݒ�
	player->SetRotDest(fRotDest);

	int combostage = player->GetComboStage();
	if (m_bChargePossible && combostage != 3)
	{
		m_bChargePossible = false;
	}
}



//==========================================================================
// �h��
//==========================================================================
// ���
void CPlayerControlDefence::Defence(CPlayer* player)
{
	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();

	// �ڕW�̌����擾
	float fRotDest = player->GetRotDest();

	// ���[�V�����t���O�擾
	CPlayer::SMotionFrag motionFrag = player->GetMotionFrag();

	// �J�����̌����擾
	CCamera* pCamera = CManager::GetInstance()->GetCamera();
	MyLib::Vector3 Camerarot = pCamera->GetRotation();

	// �K�[�h
	if (
		(
			(pMotion->IsGetCombiable() &&
		(pMotion->GetType() == CPlayer::MOTION::MOTION_COUNTER_TURN || pMotion->GetType() == CPlayer::MOTION::MOTION_COUNTER_ATTACK)) ||
		pMotion->IsGetCancelable()
			) &&
		!player->IsJump() &&
		pInputGamepad->GetPress(CInputGamepad::BUTTON_RB, player->GetMyPlayerIdx()))
	{
		pMotion->Set(CPlayer::MOTION_DEF);

		if (pInputGamepad->IsTipStick())
		{// ���X�e�B�b�N���|��Ă�ꍇ
			fRotDest = D3DX_PI + pInputGamepad->GetStickRotL(player->GetMyPlayerIdx()) + Camerarot.y;
		}

		pMotion->Set(CPlayer::MOTION_GUARD);
		motionFrag.bGuard = true;	// �K�[�hON
	}

	// �ڕW�̌����ݒ�
	player->SetRotDest(fRotDest);

	// ���[�V�����t���O�ݒ�
	player->SetMotionFrag(motionFrag);
}

// ���x��1
void CPlayerControlDefence_Level1::Defence(CPlayer* player)
{
	// �h��
	CPlayerControlDefence::Defence(player);


	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();

	// ���[�V�����t���O�擾
	CPlayer::SMotionFrag motionFrag = player->GetMotionFrag();

	// �K�[�h���ɍU���ŃJ�E���^�[
	if (pMotion->GetType() == CPlayer::MOTION_GUARD &&
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON_X, player->GetMyPlayerIdx()))
	{
		pMotion->Set(CPlayer::MOTION_COUNTER_ACCEPT);
		motionFrag.bCounter = true;		// �U������ON
	}

	// ���[�V�����t���O�ݒ�
	player->SetMotionFrag(motionFrag);
}

//==========================================================================
// ���
//==========================================================================
void CPlayerControlAvoid::Avoid(CPlayer* player)
{
	// �C���v�b�g���擾
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	// ���݂̎�ގ擾
	CMotion* pMotion = player->GetMotion();

	// �ڕW�̌����擾
	float fRotDest = player->GetRotDest();

	// �J�����̌����擾
	CCamera* pCamera = CManager::GetInstance()->GetCamera();
	MyLib::Vector3 Camerarot = pCamera->GetRotation();

	// ���
	if (!player->IsJump() &&
		(pMotion->IsGetCombiable() || pMotion->IsGetCancelable()) &&
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON_B, player->GetMyPlayerIdx()))
	{
		pMotion->Set(CPlayer::MOTION_DEF);
		pMotion->Set(CPlayer::MOTION_AVOID);

		if (pInputGamepad->IsTipStick())
		{// ���X�e�B�b�N���|��Ă�ꍇ

			fRotDest = D3DX_PI + pInputGamepad->GetStickRotL(player->GetMyPlayerIdx()) + Camerarot.y;
		}
	}

	// �ڕW�̌����ݒ�
	player->SetRotDest(fRotDest);
}




//==========================================================================
// �K�[�h
//==========================================================================
// �󂯂����̏���
void CPlayerGuard::HitProcess(CPlayer* player, MyLib::Vector3 enemypos)
{
	
	// �ʒu�擾
	MyLib::Vector3 pos = player->GetPosition();
	MyLib::Vector3 rot = player->GetRotation();

	// �ڕW�̊p�x�ݒ�
	float fRotDest = atan2f((pos.x - enemypos.x), (pos.z - enemypos.z));
	player->SetRotation(MyLib::Vector3(rot.x, fRotDest, rot.z));
	player->SetRotDest(fRotDest);

	player->SetMove(MyLib::Vector3(
		sinf(fRotDest) * 40.0f,
		0.0f,
		cosf(fRotDest) * 40.0f));
}