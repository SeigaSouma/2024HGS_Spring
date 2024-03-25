//=============================================================================
// 
//  �����w�b�_�[ [busket.h]
//  Author : �Ό��D�n
// 
//=============================================================================

#ifndef _BUSKET_H_
#define _BUSKET_H_	// ��d�C���N���[�h�h�~

#include "object.h"

//==========================================================================
// �N���X��`
//==========================================================================
// �̗̓Q�[�W�N���X��`
class CBusket : public CObject
{
public:

	CBusket(int nMaxPollen, int nPriority = mylib_const::PRIORITY_DEFAULT);
	~CBusket();

	static CBusket *Create(int nMaxPollen);

	// �I�[�o�[���C�h���ꂽ�֐�
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	//�ԕ����炷
	void Lost(void);
	void Boost(void);

	//�擾
	int GetPollen(void) { return m_nPollen; }

private:
	int m_nPollen;				//���݂̉ԕ���
	const int m_nMaxPollen;		//�ő�ԕ���
};


#endif