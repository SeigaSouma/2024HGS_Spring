//=============================================================================
// 
//  �G�̋��_�w�b�_�[ [enemybase.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _ENEMYBASE_H_
#define _ENEMYBASE_H_	// ��d�C���N���[�h�h�~

#include "main.h"
#include "constans.h"
#include "object.h"

//==========================================================================
// �O���錾
//==========================================================================
class CDebugPointNumber;

//==========================================================================
// �N���X��`
//==========================================================================
// �J�����̎��N���X��`
class CEnemyBase
{
public:

	// �\���̒�`
	struct sInfo
	{
		MyLib::Vector3 pos;		// �ʒu
		MyLib::Vector3 rot;		// ����
		int nPattern;			// ���
		int nRush;				// ���b�V���p���ǂ���
	};

	CEnemyBase();
	~CEnemyBase();

	HRESULT Init();
	void Uninit();
	void Update();

	void CreatePos(int nStage, int nPattern, MyLib::Vector3 pos, int nRush);	// �ʒu�쐬
	void DeletePos(int nStage, int nIdx);					// �ʒu�폜
	HRESULT ReadText(const char *pFileName);	// �O���t�@�C���ǂݍ��ݏ���
	void Save();			// �O���t�@�C�������o������

	static CEnemyBase *Create(const char *pFileName);
	int GetSpawnPointNum();			// �ʒu���擾
	MyLib::Vector3 GetSpawnPoint(int nStage, int nIdx);	// �ʒu�擾
	void SetSpawnPoint(int nStage, int nIdx, MyLib::Vector3 pos);	// �ʒu�ݒ�
	sInfo GetEnemyBaseInfo(int nStage, int nIdx);	// �ύX�̏��擾

	int GetNumBase(int nStage) { return m_nBaseNum[nStage]; }	// �X�e�[�W���̋��_�̐��擾
	int GetNumStage() { return m_nNumStage; }	// �X�e�[�W�̑����擾
	int GetNumAll() { return m_nNumAll; }	// �����擾
private:

	std::vector<std::vector<sInfo>> m_EnemyBaseInfo;		// ���_�̏��
	CObjectX *m_apObjX[mylib_const::MAX_CAMERAAXIS];	// �I�u�W�F�N�gX

	int m_nNumStage;	// �X�e�[�W�̑���
	std::vector<int> m_nBaseNum;	// ���_�̐�
	int m_nNumAll;		// ����
};



#endif