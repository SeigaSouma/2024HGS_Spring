//=============================================================================
// 
//  かご処理 [busket.cpp]
//  Author : 石原颯馬
// 
//=============================================================================
#include "busket.h"
#include "manager.h"
#include "camera.h"
#include "pollen_gauge.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	int LOST_VALUE = 25;
	int BOOST_VALUE = 25;
}

//==========================================================================
// 静的メンバ変数宣言
//==========================================================================


//==========================================================================
// コンストラクタ
//==========================================================================
CBusket::CBusket(int nMaxPollen, int nPriority) : CObject(nPriority), m_nMaxPollen(nMaxPollen)
{
	m_nPollen = 0;
	m_bEmpty = false;
}

//==========================================================================
// デストラクタ
//==========================================================================
CBusket::~CBusket()
{

}

//==========================================================================
// 生成処理
//==========================================================================
CBusket* CBusket::Create(int nMaxPollen)
{
	// 生成用のオブジェクト
	CBusket* pBusket = nullptr;

	// メモリの確保
	pBusket = DEBUG_NEW CBusket(nMaxPollen);

	if (pBusket != nullptr)
	{// メモリの確保が出来ていたら

		// 初期化処理
		pBusket->Init();

		// 種類の設定
		pBusket->SetType(TYPE_HPGAUGE);
	}

	return pBusket;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CBusket::Init()
{
	// 花粉量初期値入れる
	m_nPollen = m_nMaxPollen;

	m_pPollenGauge = CPollen_Gauge::Create(MyLib::Vector3(640.0f, 600.0f, 0.0f), m_nMaxPollen);

	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CBusket::Uninit()
{
	// 情報削除
	Release();
}

//==========================================================================
// 更新処理
//==========================================================================
void CBusket::Update()
{
	m_pPollenGauge->SetValue(m_nPollen);
	m_pPollenGauge->Update();
}

//==========================================================================
// 描画処理
//==========================================================================
void CBusket::Draw()
{
	
	m_pPollenGauge->Draw();
}

//==========================================================================
// ぶつかって減らす処理
//==========================================================================
void CBusket::Lost(void)
{
	m_nPollen -= LOST_VALUE;

	if (m_nPollen <= 0)
	{
		m_nPollen = 0;
		m_bEmpty = true;
	}
}

//==========================================================================
// 粉塵爆発ブースト処理
//==========================================================================
void CBusket::Boost(void)
{
	m_nPollen -= BOOST_VALUE;

	if (m_nPollen <= 0)
	{
		m_nPollen = 0;
		m_bEmpty = true;
	}
}
