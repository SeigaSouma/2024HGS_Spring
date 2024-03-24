//=============================================================================
//
// ���͏��� [input.h]
// Author : ���n�Ή�
//
//=============================================================================

#ifndef _INPUT_H_	//���̃}�N����`������Ă��Ȃ�������
#define _INPUT_H_	//��d�C���N���[�h�h�~�̃}�N�����`����

#include "main.h"
#include "constans.h"
#pragma comment(lib, "xinput.lib")	//�R���g���[���[�ɕK�v

//==========================================================================
// �}�N����`
//==========================================================================
#define NUM_KEY_MAX	(256)	// �L�[�̍ő吔

//==========================================================================
// �N���X��`
//==========================================================================
// ���̓N���X
class CInput
{
public:
	CInput();
	virtual ~CInput();

	virtual HRESULT Init(HINSTANCE hInstance, HWND hWnd);
	virtual void Uninit();
	virtual void Update() = 0;

protected:
	static int nNumAll;					// ����
	static LPDIRECTINPUT8 m_pInput;		// DirectInput�I�u�W�F�N�g�ւ̃|�C���^
	LPDIRECTINPUTDEVICE8 m_pDevice;		// ���̓f�o�C�X�ւ̃|�C���^
};

// �L�[�{�[�h�N���X
class CInputKeyboard : public CInput
{
public:

	CInputKeyboard();
	~CInputKeyboard();

	HRESULT Init(HINSTANCE hInstance, HWND hWnd);
	void Uninit();
	void Update();
	bool GetPress(int nKey);
	bool GetTrigger(int nKey);
	bool GetRelease(int nKey);
	bool GetRepeat(int nKey, int nPattern);

private:
	int m_nPatternRepeat[NUM_KEY_MAX];		// ���s�\�g�̊Ԋu
	int m_nCntKeyRepeat[NUM_KEY_MAX];		// ���s�[�g�p�J�E���g
	BYTE m_aKeyState[NUM_KEY_MAX];			// �v���X���
	BYTE m_aKeyStateTrigger[NUM_KEY_MAX];	// �g���K�[���
	BYTE m_aKeyStateRelease[NUM_KEY_MAX];	// �����[�X���
	BYTE m_aKeyStateRepeat[NUM_KEY_MAX];	// ���s�[�g���
};

// �W���C�p�b�h�N���X
class CInputGamepad
{
public:

	// �񋓌^��`
	typedef enum
	{
		BUTTON_UP = 0,
		BUTTON_DOWN,
		BUTTON_LEFT,
		BUTTON_RIGHT,
		BUTTON_START,
		BUTTON_BACK,
		BUTTON_LSTICKPUSH,
		BUTTON_RSTICKPUSH,
		BUTTON_LB,
		BUTTON_RB,
		BUTTON_LT,
		BUTTON_RT,
		BUTTON_A,
		BUTTON_B,
		BUTTON_X,
		BUTTON_Y,
		BUTTON_LX,
		BUTTON_LY,
		BUTTON_18,
		BUTTON_19,
		BUTTON_MAX
	}BUTTON;

	// �񋓌^��`
	enum STICK
	{
		STICK_X = 0,
		STICK_Y,
		STICK_MAX
	};

	typedef enum
	{
		VIBRATION_STATE_NONE = 0,	//�������ĂȂ����
		VIBRATION_STATE_ENEMYHIT,	//�_���[�W���
		VIBRATION_STATE_DMG,		//�_���[�W���
		VIBRATION_STATE_ITEM,		//�A�C�e��
		VIBRATION_STATE_RESPAWN,	// ���X�|�[��

	}VIBRATION_STATE;

	CInputGamepad();
	~CInputGamepad();

	HRESULT Init(HINSTANCE hInstance, HWND hWnd);
	void Uninit();
	void Update();

	// �{�^���n
	bool GetPress(BUTTON nKey, int nCntPlayer);
	bool GetTrigger(BUTTON nKey, int nCntPlayer);
	bool GetRepeat(BUTTON nKey, int nCntPlayer);
	bool GetRelease(int nKey, int nCntPlayer);

	// �g���K�[�n
	bool GetPressLT(int nCntPlayer);	// LT�̃v���X����
	bool GetPressRT(int nCntPlayer);	// RT�̃v���X����
	bool GetTriggerLT(int nCntPlayer);	// LT�̃g���K�[����
	bool GetTriggerRT(int nCntPlayer);	// RT�̃g���K�[����

	// �X�e�B�b�N�n
	bool GetLStickTrigger(STICK XY);	// �X�e�B�b�N�̃g���K�[����
	bool GetRStickTrigger(STICK XY);	// �X�e�B�b�N�̃g���K�[����
	MyLib::Vector3 GetStickMoveL(int nCntPlayer);
	MyLib::Vector3 GetStickMoveR(int nCntPlayer);
	MyLib::Vector3 GetStickPositionRatioL(int nCntPlayer);	// ���X�e�B�b�N�̊����擾
	MyLib::Vector3 GetStickPositionRatioR(int nCntPlayer);	// �E�X�e�B�b�N�̊����擾
	float GetStickRotL(int nCntPlayer);					// �X�e�B�b�N�̌����擾
	float GetStickRotR(int nCntPlayer);					// �X�e�B�b�N�̌����擾
	bool IsTipStick() { return m_bLStickTip; }		// �X�e�B�b�N���|��Ă邩�̔���

	// �o�C�u���[�V�����n
	void SetEnableVibration();
	bool GetEnableVibration();
	void SetVibration(VIBRATION_STATE VibState, int nCntPlayer);
	int GetnCntPad();

private:

	void UpdateStickTrigger();		// �X�e�B�b�N�̃g���K�[����
	void UpdateTriggerState(int nCntPlayer, XINPUT_STATE inputstate);	// �g���K�[�̔��菈��

	// �����o�ϐ�
	XINPUT_STATE m_aGamepadState[mylib_const::MAX_PLAYER];				// �v���X���
	XINPUT_STATE m_aGamepadStateTrigger[mylib_const::MAX_PLAYER];		// �g���K�[���
	XINPUT_STATE m_aGamepadStateRepeat[mylib_const::MAX_PLAYER];		// ���s�[�g���
	XINPUT_STATE m_aGamepadStateRelease[mylib_const::MAX_PLAYER];		// �����[�X���
	XINPUT_VIBRATION m_aGamepadStateVib[mylib_const::MAX_PLAYER];		// �o�C�u���[�V����
	VIBRATION_STATE m_VibrationState[mylib_const::MAX_PLAYER];			// �U���̎��
	int m_nCntVibration[mylib_const::MAX_PLAYER];						// �U���̎���
	int m_nMaxCntVibration[mylib_const::MAX_PLAYER];					// �U���̎���
	int m_nCntPadrepeat;									// ���s�[�g�p�J�E���g

	// �g���K�[
	struct sTrigger
	{
		bool bPress;	// �v���X����
		bool bTrigger;	// �g���K�[����

		sTrigger() :bPress(false), bTrigger(false) {}
	};
	sTrigger m_StateLT[mylib_const::MAX_PLAYER];	// LT�̔���
	sTrigger m_StateRT[mylib_const::MAX_PLAYER];	// RT�̔���

	// �X�e�B�b�N
	bool m_bLeftStickSelect[STICK_MAX];						// ���X�e�B�b�N�̑I�𔻒�
	bool m_bLeftStickTrigger[STICK_MAX];					// ���X�e�B�b�N�̃g���K�[����
	bool m_bRightStickSelect[STICK_MAX];					// �E�X�e�B�b�N�̑I�𔻒�
	bool m_bRightStickTrigger[STICK_MAX];					// �E�X�e�B�b�N�̃g���K�[����
	bool m_bLStickTip;										// ���X�e�B�b�N�̌X������
	bool m_bVibrationUse;									// �o�C�u���g�p���邩�ǂ���
};

// �}�E�X�N���X
class CInputMouse : public CInput
{
public:

	// �񋓌^��`
	typedef enum
	{
		BUTTON_LEFT = 0,
		BUTTON_RIGHT,
		BUTTON_WHEEL,
		BUTTON_SIDE_1,
		BUTTON_SIDE_2
	}BUTTON;

	CInputMouse();
	~CInputMouse();

	HRESULT Init(HINSTANCE hInstance, HWND hWnd);
	void Uninit();
	void Update();
	bool GetPress(BUTTON nKey);
	MyLib::Vector3 GetMouseMove();

private:
	DIMOUSESTATE2 m_MouseState;			//�S���͏��̕ۊ�
	DIMOUSESTATE2 m_MouseStateTrigger;	//�g���K�[���
	DIMOUSESTATE2 m_MouseStateRerease;	//�����[�X���
	DIMOUSESTATE2 m_MouseStateRepeat;	//���s�[�g���
	BYTE aOldState[8];					//�O��̓��͏���ۑ�
};

#endif