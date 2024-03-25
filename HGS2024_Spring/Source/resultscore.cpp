//=============================================================================
// 
//  スコア処理 [resultscore.cpp]
//  Author : 髙田佳依
// 
//=============================================================================
#include "resultscore.h"
#include "manager.h"
#include "calculation.h"
#include "input.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	const char* TEXTURE_NUMBER = "data\\TEXTURE\\number\\number_oradano.png";		// 数字のテクスチャ
	const D3DXVECTOR2 SCORESIZE = D3DXVECTOR2(40.0f, 40.0f);
}

//==========================================================================
// コンストラクタ
//==========================================================================
CResultScore::CResultScore(int nPriority) : CObject(nPriority)
{
	m_pScore = nullptr;
}

//==========================================================================
// デストラクタ
//==========================================================================
CResultScore::~CResultScore()
{

}

//==========================================================================
// 生成処理
//==========================================================================
CResultScore* CResultScore::Create()
{
	// メモリの確保
	CResultScore* pMarker = DEBUG_NEW CResultScore;

	if (pMarker != nullptr)
	{
		// 初期化処理
		pMarker->Init();
	}

	return pMarker;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CResultScore::Init()
{
	// 数字生成
	CreateScore();		// 被ダメージ生成
	
	CManager::GetInstance()->GetSound()->PlaySound(CSound::LABEL::LABEL_SE_BATTLERESULT);

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CResultScore::Uninit()
{
	if (m_pScore != nullptr)
	{
		m_pScore->Uninit();
		m_pScore = nullptr;
	}
}

//==========================================================================
// 削除
//==========================================================================
void CResultScore::Kill()
{
	if (m_pScore != nullptr)
	{
		m_pScore->Release();
		m_pScore = nullptr;
	}
}

//==========================================================================
// 更新処理
//==========================================================================
void CResultScore::Update()
{
	m_pScore->Update();
}

//==========================================================================
// 死亡回数生成
//==========================================================================
void CResultScore::CreateScore()
{
	// 今回の評価情報取得

	m_pScore = CMultiNumber::Create(
		MyLib::Vector3(SCREEN_HEIGHT * 0.5f, SCREEN_WIDTH * 0.5f, 0.0f),
		SCORESIZE,
		5,
		CNumber::EObjectType::OBJECTTYPE_2D,
		true, GetPriority());
	if (m_pScore == nullptr)
	{
		return;
	}

	// 右寄せに設定
	m_pScore->SetAlignmentType(CMultiNumber::AlignmentType::ALIGNMENT_RIGHT);

	// 色設定
	m_pScore->SetColor(D3DXCOLOR(1.0f, 1.0f, 1.0f, 1.0f));
}

//==========================================================================
// 描画処理
//==========================================================================
void CResultScore::Draw()
{
	// デバイスの取得
	LPDIRECT3DDEVICE9 pDevice = CManager::GetInstance()->GetRenderer()->GetDevice();

	// アルファテストを有効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);

	// オブジェクト2Dの描画
	m_pScore->Draw();

	// アルファテストを無効にする
	pDevice->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	pDevice->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_ALWAYS);
	pDevice->SetRenderState(D3DRS_ALPHAREF, 0);
}
