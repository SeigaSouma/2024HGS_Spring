//=============================================================================
// 
//  �I�u�W�F�N�g2D���� [object2D.cpp]
//  Author : ���n�Ή�
// 
//=============================================================================
#include "object2D.h"
#include "manager.h"
#include "pause.h"

//==========================================================================
// �萔��`
//==========================================================================
namespace
{
	const int POLYGON_TOP = 4;	// �|���S���̒��_��
}

//==========================================================================
// �R���X�g���N�^
//==========================================================================
CObject2D::CObject2D(int nPriority) : CObject(nPriority)
{
	m_col = D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f);	// �F
	m_size = D3DXVECTOR2(0.0f, 0.0f);			// �T�C�Y
	m_sizeOrigin = D3DXVECTOR2(0.0f, 0.0f);		// ���̃T�C�Y
	m_fLength = 0.0f;							// �Ίp���̒���
	m_fAngle = 0.0f;							// �Ίp���̌���
	m_pVtxBuff = nullptr;							// ���_�o�b�t�@
	m_nTexIdx = 0;								// �e�N�X�`���̃C���f�b�N�X�ԍ�

	for (int nCntVtx = 0; nCntVtx < 32; nCntVtx++)
	{
		m_fTex[nCntVtx] = D3DXVECTOR2(0.0f, 0.0f);			// �e�N�X�`�����W
		m_VtxPos[nCntVtx] = MyLib::Vector3(0.0f, 0.0f, 0.0f);	// ���_���W
	}

}

//==========================================================================
// �f�X�g���N�^
//==========================================================================
CObject2D::~CObject2D()
{

}

//==========================================================================
// �e�N�X�`���̊��蓖��
//==========================================================================
void CObject2D::BindTexture(int nIdx)
{
	// ���蓖�Ă�
	m_nTexIdx = nIdx;
}

//==========================================================================
// ��������
//==========================================================================
CObject2D *CObject2D::Create()
{
	// �������̊m��
	CObject2D* pObject2D = DEBUG_NEW CObject2D;

	if (pObject2D != nullptr)
	{
		// ����������
		pObject2D->Init();
	}

	return pObject2D;
}

//==========================================================================
// ��������
//==========================================================================
CObject2D* CObject2D::Create(int nPriority)
{
	// �������̊m��
	CObject2D* pObject2D = DEBUG_NEW CObject2D(nPriority);

	if (pObject2D != nullptr)
	{
		// ����������
		pObject2D->Init();
	}

	return pObject2D;
}

//==========================================================================
// ��������
//==========================================================================
CObject2D* CObject2D::Create(int nPriority, int nNumVtx)
{

	// �������̊m��
	CObject2D* pObject2D = DEBUG_NEW CObject2D(nPriority);

	if (pObject2D != nullptr)
	{// �������̊m�ۂ��o���Ă�����

		// ����������
		pObject2D->Init(nNumVtx);
	}

	return pObject2D;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CObject2D::Init()
{
	HRESULT hr;

	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	m_fTex[0] = D3DXVECTOR2(0.0f, 0.0f);	// �e�N�X�`�����W
	m_fTex[1] = D3DXVECTOR2(1.0f, 0.0f);	// �e�N�X�`�����W
	m_fTex[2] = D3DXVECTOR2(0.0f, 1.0f);	// �e�N�X�`�����W
	m_fTex[3] = D3DXVECTOR2(1.0f, 1.0f);	// �e�N�X�`�����W

	// ���_�o�b�t�@�̐���
	if (m_pVtxBuff != nullptr)
	{// ���ɏ�񂪓����Ă�ꍇ

		return E_FAIL;
	}

	hr = pDevice->CreateVertexBuffer(sizeof(VERTEX_2D) * POLYGON_TOP,
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_2D,
		D3DPOOL_MANAGED,
		&m_pVtxBuff,
		nullptr);

	if (FAILED(hr))
	{// ���s�����Ƃ�

		return E_FAIL;
	}

	// ���_���ݒ�
	SetVtx();

	// ��ސݒ�
	SetType(CObject::TYPE::TYPE_OBJECT2D);

	return S_OK;
}

//==========================================================================
// ����������
//==========================================================================
HRESULT CObject2D::Init(int nNumVertex)
{
	HRESULT hr;

	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	m_fTex[0] = D3DXVECTOR2(0.0f, 0.0f);	// �e�N�X�`�����W
	m_fTex[1] = D3DXVECTOR2(1.0f, 0.0f);	// �e�N�X�`�����W
	m_fTex[2] = D3DXVECTOR2(0.0f, 1.0f);	// �e�N�X�`�����W
	m_fTex[3] = D3DXVECTOR2(1.0f, 1.0f);	// �e�N�X�`�����W

	// ���_�o�b�t�@�̐���
	if (m_pVtxBuff != nullptr)
	{// ���ɏ�񂪓����Ă�ꍇ

		return E_FAIL;
	}

	hr = pDevice->CreateVertexBuffer(sizeof(VERTEX_2D) * nNumVertex,
		D3DUSAGE_WRITEONLY,
		FVF_VERTEX_2D,
		D3DPOOL_MANAGED,
		&m_pVtxBuff,
		nullptr);

	if (FAILED(hr))
	{// ���s�����Ƃ�

		return E_FAIL;
	}

	// ���_���ݒ�
	SetVtx(nNumVertex);

	return S_OK;
}

//==========================================================================
// �I������
//==========================================================================
void CObject2D::Uninit()
{
	// ���_�o�b�t�@�̔j��
	if (m_pVtxBuff != nullptr)
	{
		m_pVtxBuff->Release();
		m_pVtxBuff = nullptr;
	}

	// �I�u�W�F�N�g�̔j��
	Release();
}

//==========================================================================
// �X�V����
//==========================================================================
void CObject2D::Update()
{
	// ���_���ݒ�
	SetVtx();
}

//==========================================================================
// �`�揈��
//==========================================================================
void CObject2D::Draw()
{
#if _DEBUG
	if (CManager::GetInstance()->GetPause() != nullptr)
	{
		if (CManager::GetInstance()->GetPause()->IsPause())
		{
			//return;
		}
	}
#endif

	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, m_pVtxBuff, 0, sizeof(VERTEX_2D));

	// ���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_2D);

	// �e�N�X�`���̐ݒ�
	pDevice->SetTexture(0, CTexture::GetInstance()->GetAdress(m_nTexIdx));

	// �|���S���̕`��
	pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
}

//==========================================================================
// �`�揈��(�}���`�e�N�X�`��)
//==========================================================================
void CObject2D::Draw(LPDIRECT3DTEXTURE9 mutitex)
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// ���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, m_pVtxBuff, 0, sizeof(VERTEX_2D));

	// ���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_2D);

	// �e�N�X�`���̐ݒ�
	pDevice->SetTexture(0, CTexture::GetInstance()->GetAdress(m_nTexIdx));
	pDevice->SetTexture(1, mutitex);

	// �|���S���̕`��
	pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
}

//==========================================================================
// �`�揈��
//==========================================================================
void CObject2D::Draw(int nNumVertex)
{
	// �f�o�C�X�̎擾
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	//���_�o�b�t�@���f�[�^�X�g���[���ɐݒ�
	pDevice->SetStreamSource(0, m_pVtxBuff, 0, sizeof(VERTEX_2D));

	// ���_�t�H�[�}�b�g�̐ݒ�
	pDevice->SetFVF(FVF_VERTEX_2D);

	// �e�N�X�`���̐ݒ�
	pDevice->SetTexture(0, CTexture::GetInstance()->GetAdress(m_nTexIdx));

	// �|���S���̕`��
	pDevice->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 1);
}

//==========================================================================
// ���_���ݒ菈��
//==========================================================================
void CObject2D::SetVtx()
{

	// ���_���ւ̃|�C���^
	VERTEX_2D *pVtx;

	// ���_�o�b�t�@�����b�N���A���_���ւ̃|�C���^���擾
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	MyLib::Vector3 pos = GetPosition();
	MyLib::Vector3 rot = GetRotation();
	D3DXCOLOR col = GetColor();
	float fAngle = GetAngle();
	float fLength = GetLength();

	// ���_���W�̐ݒ�
	pVtx[0].pos.x = pos.x + sinf(rot.z - D3DX_PI + fAngle) * fLength;
	pVtx[0].pos.y = pos.y + cosf(rot.z - D3DX_PI + fAngle) * fLength;
	pVtx[0].pos.z = 0.0f;

	pVtx[1].pos.x = pos.x + sinf(rot.z + D3DX_PI - fAngle) * fLength;
	pVtx[1].pos.y = pos.y + cosf(rot.z + D3DX_PI - fAngle) * fLength;
	pVtx[1].pos.z = 0.0f;

	pVtx[2].pos.x = pos.x + sinf(rot.z - fAngle) * fLength;
	pVtx[2].pos.y = pos.y + cosf(rot.z - fAngle) * fLength;
	pVtx[2].pos.z = 0.0f;

	pVtx[3].pos.x = pos.x + sinf(rot.z + fAngle) * fLength;
	pVtx[3].pos.y = pos.y + cosf(rot.z + fAngle) * fLength;
	pVtx[3].pos.z = 0.0f;

	// rhw�̐ݒ�
	pVtx[0].rhw = 1.0f;
	pVtx[1].rhw = 1.0f;
	pVtx[2].rhw = 1.0f;
	pVtx[3].rhw = 1.0f;

	// ���_�J���[�̐ݒ�
	pVtx[0].col = col;
	pVtx[1].col = col;
	pVtx[2].col = col;
	pVtx[3].col = col;

	// �e�N�X�`�����W�̐ݒ�
	pVtx[0].tex = m_fTex[0];
	pVtx[1].tex = m_fTex[1];
	pVtx[2].tex = m_fTex[2];
	pVtx[3].tex = m_fTex[3];

	// ���_�o�b�t�@���A�����b�N���b�N
	m_pVtxBuff->Unlock();
}

//==========================================================================
// ���_���ݒ菈��
//==========================================================================
void  CObject2D::SetVtx(int nNumVertex)
{
	// ���_���ւ̃|�C���^
	VERTEX_2D *pVtx;

	// ���_�o�b�t�@�����b�N���A���_���ւ̃|�C���^���擾
	m_pVtxBuff->Lock(0, 0, (void**)&pVtx, 0);

	MyLib::Vector3 pos = GetPosition();
	MyLib::Vector3 rot = GetRotation();
	D3DXCOLOR col = GetColor();
	MyLib::Vector3 *pVtxPos = GetVtxPos();

	// ���_���W�̐ݒ�
	for (int nCntVtx = 0; nCntVtx < nNumVertex; nCntVtx++)
	{
		pVtx[nCntVtx].pos.x = pos.x + pVtxPos[nCntVtx].x;
		pVtx[nCntVtx].pos.y = pos.y + pVtxPos[nCntVtx].y;
		pVtx[nCntVtx].pos.z = 0.0f;

		// rhw�̐ݒ�
		pVtx[nCntVtx].rhw = 1.0f;

		// ���_�J���[�̐ݒ�
		pVtx[nCntVtx].col = col;

		// �e�N�X�`�����W�̐ݒ�
		pVtx[nCntVtx].tex = D3DXVECTOR2(0.0f, 0.0f);
	}

	// ���_�o�b�t�@���A�����b�N���b�N
	m_pVtxBuff->Unlock();
}

//==========================================================================
// �F�ݒ�
//==========================================================================
void CObject2D::SetColor(const D3DXCOLOR col)
{
	m_col = col;
}

//==========================================================================
// �F�擾
//==========================================================================
D3DXCOLOR CObject2D::GetColor() const
{
	return m_col;
}

//==========================================================================
// �s�����x�ݒ�
//==========================================================================
void CObject2D::SetAlpha(const float alpha)
{
	m_col.a = alpha;
}

//==========================================================================
// �s�����x�擾
//==========================================================================
float CObject2D::GetAlpha() const
{
	return m_col.a;
}

//==========================================================================
// �T�C�Y�ݒ�
//==========================================================================
void CObject2D::SetSize(const D3DXVECTOR2 size)
{
	m_size = size;		// �T�C�Y
	SetLength(sqrtf(m_size.x * m_size.x + m_size.y * m_size.y));	// �Ίp���̒���
	SetAngle(atan2f(m_size.x, m_size.y));								// �Ίp���̌���
}

//==========================================================================
// �T�C�Y�擾
//==========================================================================
D3DXVECTOR2 CObject2D::GetSize() const
{
	return m_size;
}

//==========================================================================
// ���̃T�C�Y�̐ݒ�
//==========================================================================
void CObject2D::SetSizeOrigin(const D3DXVECTOR2 size)
{
	m_sizeOrigin = size;
}

//==========================================================================
// ���̃T�C�Y�̎擾
//==========================================================================
D3DXVECTOR2 CObject2D::GetSizeOrigin() const
{
	return m_sizeOrigin;
}

//==========================================================================
// �e�N�X�`�����W�ݒ�
//==========================================================================
void CObject2D::SetTex(D3DXVECTOR2 *tex)
{
	memcpy(&m_fTex[0], tex, sizeof(m_fTex));
}

//==========================================================================
// �e�N�X�`�����W�擾
//==========================================================================
D3DXVECTOR2 *CObject2D::GetTex()
{
	return &m_fTex[0];
}

//==========================================================================
// �Ίp���̒����ݒ�
//==========================================================================
void CObject2D::SetLength(const float fLength)
{
	m_fLength = fLength;
}

//==========================================================================
// �Ίp���̒����擾
//==========================================================================
float CObject2D::GetLength() const
{
	return m_fLength;
}

//==========================================================================
// �Ίp���̌����擾
//==========================================================================
void CObject2D::SetAngle(const float fAngle)
{
	m_fAngle = fAngle;
}

//==========================================================================
// �Ίp���̌����擾
//==========================================================================
float CObject2D::GetAngle() const
{
	return m_fAngle;
}


//==========================================================================
// ���_���W�擾
//==========================================================================
MyLib::Vector3 *CObject2D::GetVtxPos()
{
	return &m_VtxPos[0];
}

//==========================================================================
// ���_���W�ݒ�
//==========================================================================
void CObject2D::SetVtxPos(MyLib::Vector3 *pos)
{
	memcpy(&m_VtxPos[0], pos, sizeof(m_VtxPos));
}

//==========================================================================
// ���_�o�b�t�@�̎擾
//==========================================================================
LPDIRECT3DVERTEXBUFFER9 CObject2D::GetVtxBuff() const
{
	return m_pVtxBuff;
}

//==========================================================================
// �I�u�W�F�N�g2D�I�u�W�F�N�g�̎擾
//==========================================================================
CObject2D *CObject2D::GetObject2D()
{
	return this;
}