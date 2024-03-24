//=============================================================================
// 
//  �G�̃}�l�[�W���w�b�_�[ [enemymanager.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _ENEMYMANAGER_H_
#define _ENEMYMANAGER_H_	// ��d�C���N���[�h�h�~

#include "main.h"
#include "constans.h"

//==========================================================================
// �O���錾
//==========================================================================
class CEnemy;
class CEnemyBoss;

//==========================================================================
// �N���X��`
//==========================================================================
// �G�̃}�l�[�W���N���X��`
class CEnemyManager
{
public:

	// �\���̒�`
	struct EnemyData
	{
		int nType;	// �L�����N�^�[���
		int nStartFrame;	// �����t���[��
		MyLib::Vector3 pos;		// �ʒu
	};

	struct Pattern
	{
		int nNumEnemy;	// �G�̐�
		int nFixedType;	// ���̓����̎��
		EnemyData EnemyData[mylib_const::MAX_PATTEN_ENEMY];
	};

	// �񋓌^��`
	enum STATE
	{
		STATE_NONE = 0,		// �����Ȃ����
		STATE_MAX
	};

	CEnemyManager();
	~CEnemyManager();

	HRESULT Init();
	void Uninit();
	void Update();

	static CEnemyManager *Create(const std::string pTextFile);
	HRESULT ReadText(const std::string pTextFile);	// �O���t�@�C���ǂݍ��ݏ���
	void SetStageEnemy();	// �X�e�[�W���̓G�z�u
	void SetStageBoss();	// �{�X�X�e�[�W�̓G�z�u
	CEnemy **SetEnemy(MyLib::Vector3 pos, MyLib::Vector3 rot, int nPattern);	// �G�z�u
	int GetPatternNum();

	bool IsChangeStage() { return m_bChangeStage; }	// �X�e�[�W�ύX����
	void SetEnableChangeStage(bool bChange) { m_bChangeStage = bChange; }	// �X�e�[�W�ύX�̏�Ԑ؂�ւ�
	STATE GetState() { return m_state; }	// ��Ԏ擾
	Pattern GetPattern(int nPattern);	// �p�^�[���擾
	CEnemyBoss *GetBoss();		// �{�X�擾
	const char *GetMotionFilename(int nType);
protected:


private:

	CEnemyBoss *m_pBoss;											// �{�X
	Pattern m_aPattern[mylib_const::MAX_PATTEN_ENEMY];			// �z�u�̎��
	std::string sMotionFileName[mylib_const::MAX_PATTEN_ENEMY];	// ���[�V�����t�@�C����
	STATE m_state;			// ���
	int m_nPatternNum;		// �o���p�^�[����
	int m_nNumChara;		// �G�̎�ނ̑���
	bool m_bChangeStage;	// �X�e�[�W�ύX����
};



#endif