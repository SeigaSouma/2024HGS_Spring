//=============================================================================
// 
//  つぼみ処理 [flower_bud.cpp]
//  Author : 相馬靜雅
// 
//=============================================================================
#include "flower_bud.h"
#include "manager.h"
#include "sound.h"
#include "particle.h"
#include "calculation.h"
#include "flower_decide.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	const char* MODEL = "data\\MODEL\\flower\\ranunculus.x";	// モデルファイル
	const int MAX_SPAWNNUM = 2048;		// 最大生成数
	const float TIME_CHARGE = 1.5f;		// チャージ時間
	const int TIME_FLOWERING = 60;	// 開花時間
}

//==========================================================================
// 関数ポインタ
//==========================================================================
CFlowerBud::STATE_FUNC CFlowerBud::m_StateFuncList[] =
{
	&CFlowerBud::StateWait,		// 待機
	&CFlowerBud::StateCharge,	// 溜め
	&CFlowerBud::StateFlowering,// 開花
};
CFlowerBud* CFlowerBud::m_ThisPtr = nullptr;

//==========================================================================
// コンストラクタ
//==========================================================================
CFlowerBud::CFlowerBud(int nPriority) : CObjectX(nPriority)
{
	// 値のクリア
	m_state = STATE::STATE_WAIT;	// 状態
	m_fStateTime = 0.0f;			// 状態タイマー
	m_fRatio = 0.0f;				// 割合
}

//==========================================================================
// デストラクタ
//==========================================================================
CFlowerBud::~CFlowerBud()
{
	
}

//==========================================================================
// 生成処理
//==========================================================================
CFlowerBud* CFlowerBud::Create(const MyLib::Vector3& pos, int maxPollen, int currentPollen)
{
	if (m_ThisPtr == nullptr)
	{// まだ生成していなかったら

		// インスタンス生成
		m_ThisPtr = DEBUG_NEW CFlowerBud;

		if (m_ThisPtr != nullptr)
		{// メモリの確保が出来ていたら

			// 位置割り当て
			m_ThisPtr->SetPosition(pos);
			m_ThisPtr->SetOriginPosition(pos);

			// 割合設定
			m_ThisPtr->m_fRatio = static_cast<float>(currentPollen) / static_cast<float>(maxPollen);

			// 初期化処理
			m_ThisPtr->Init();
		}
	}

	return m_ThisPtr;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CFlowerBud::Init()
{
	// 種類の設定
	CObject::SetType(TYPE::TYPE_OBJECTX);

	m_nSpawnNum = MAX_SPAWNNUM * m_fRatio;	// 生成数

	// 初期化処理
	HRESULT hr = CObjectX::Init(MODEL);
	if (FAILED(hr))
	{// 失敗したとき
		return E_FAIL;
	}
	return S_OK;
}

//==========================================================================
// 終了処理
//==========================================================================
void CFlowerBud::Uninit()
{
	m_ThisPtr = nullptr;

	// 終了処理
	CObjectX::Uninit();
}

//==========================================================================
// 更新処理
//==========================================================================
void CFlowerBud::Update()
{
	// 状態別処理
	(this->*(m_StateFuncList[m_state]))();
}

//==========================================================================
// 溜め
//==========================================================================
void CFlowerBud::StateCharge()
{
	// 状態タイマー加算
	m_fStateTime += CManager::GetInstance()->GetDeltaTime();

	my_particle::Create(GetPosition(), my_particle::TYPE::TYPE_FLOWERINGCHARGE);

	if (m_fStateTime >= TIME_CHARGE)
	{
		m_fStateTime = 0.0f;			// 状態タイマー
		m_state = STATE::STATE_FLOWERING;
	}
}

//==========================================================================
// 開花
//==========================================================================
void CFlowerBud::StateFlowering()
{
	// 状態タイマー加算
	m_fStateTime++;

	int num = m_nSpawnNum / TIME_FLOWERING;

	for (int i = 0; i < num; i++)
	{
		MyLib::Vector3 move;
		move.x = UtilFunc::Transformation::Random(-40, 40) * 10.0f + 1.0f;
		move.z = UtilFunc::Transformation::Random(-40, 40) * 10.0f + 1.0f;

		CDecideFlower::Create(GetPosition(), move);
	}

	if (static_cast<int>(m_fStateTime) >= TIME_FLOWERING)
	{
		Uninit();
	}
}
