//=============================================================================
// 
//  �`���[�g���A���w�b�_�[ [game_tutorial.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _GAME_TUTORIAL_H_
#define _GAME_TUTORIAL_H_	// ��d�C���N���[�h�h�~

#include "game.h"

//==========================================================================
// �O���錾
//==========================================================================

//==========================================================================
// �N���X��`
//==========================================================================
// �Q�[���N���X��`
class CGameTutorial : public CGame
{
public:

	CGameTutorial();
	~CGameTutorial();

	// �I�[�o�[���C�h���ꂽ�֐�
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void Draw() override;


private:

	virtual void InitByMode() override;	// ���[�h�ʏ�����

	//=============================
	// �����o�֐�
	//=============================

	//=============================
	// �����o�ϐ�
	//=============================
};



#endif