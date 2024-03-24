//=============================================================================
// 
//  ����(3D)�w�b�_�[ [number_3D.h]
//  Author : ���n�Ή�
// 
//=============================================================================

#ifndef _NUMBER_3D_H_
#define _NUMBER_3D_H_	// ��d�C���N���[�h�h�~

#include "number.h"
#include "object3D.h"

//==========================================================================
// �O���錾
//==========================================================================
class CObject3D;

//==========================================================================
// �N���X��`
//==========================================================================
// �w�i�N���X��`
class CNumber3D : public CNumber
{
public:

	CNumber3D(int nPriority = 6);
	~CNumber3D();

	// �����o�֐�
	HRESULT Init(int nPriority) override;
	void Uninit() override;
	void Update() override;
	void Draw() override;
	void Release() override;	// �J������

	void SetPosition(const MyLib::Vector3 pos) override;	// �ʒu�ݒ�
	MyLib::Vector3 GetPosition() const override;		// �ʒu�擾
	void SetMove(const MyLib::Vector3 move) override;		// �ړ��ʐݒ�
	MyLib::Vector3 GetMove() const override;			// �ړ��ʎ擾
	void SetRotation(const MyLib::Vector3 rot) override;	// �����ݒ�
	MyLib::Vector3 GetRotation() const override;		// �����擾

	void SetColor(const D3DXCOLOR col) override;			// �F�ݒ�
	D3DXCOLOR GetColor() const override;				// �F�擾
	void SetSize3D(const MyLib::Vector3 size) override;		// �T�C�Y�̐ݒ�
	MyLib::Vector3 GetSize3D() const override;			// �T�C�Y�̎擾
	void SetTex(D3DXVECTOR2 *tex) override;				// �e�N�X�`�����W�̐ݒ�
	D3DXVECTOR2 *GetTex() override;					// �e�N�X�`�����W�̎擾

	void SetVtx() override;
	void BindTexture(int nIdx) override;
	void SetType(const CObject::TYPE type) override;
	CObject3D *GetObject3D() override;

private:
	CObject3D *m_aObject3D;				// �I�u�W�F�N�g3D�̃I�u�W�F�N�g
	bool m_bAddAlpha;
};

#endif