//=============================================================================
// 
// タイトルエンター処理 [title_pressenter.cpp]
// Author : 相馬靜雅
// 
//=============================================================================
#include "title_pressenter.h"
#include "title.h"
#include "manager.h"
#include "sound.h"
#include "calculation.h"
#include "input.h"
#include "fade.h"

//==========================================================================
// 定数定義
//==========================================================================
namespace
{
	const char* TEXTURE = "data\\TEXTURE\\title\\title_pressbutton.png";
	const float TIME_TUTORIAL_FADEOUT = 0.3f;	// チュートリアル確認のフェードアウト
}

//==========================================================================
// 関数ポインタ
//==========================================================================
CTitle_PressEnter::STATE_FUNC CTitle_PressEnter::m_StateFunc[] =
{
	&CTitle_PressEnter::StateNone,		// なし
	&CTitle_PressEnter::StateFadeIn,	// フェードイン
	&CTitle_PressEnter::StateTutorial_FadeOut,		// チュートリアル確認のフェードアウト
};

//==========================================================================
// コンストラクタ
//==========================================================================
CTitle_PressEnter::CTitle_PressEnter(float fadetime, int nPriority) : m_fFadeOutTime(fadetime), CObject2D(nPriority)
{
	// 値のクリア
	m_state = STATE::STATE_NONE;		// 状態
	m_fStateTime = 0.0f;			// 状態カウンター
}

//==========================================================================
// 生成処理
//==========================================================================
CTitle_PressEnter* CTitle_PressEnter::Create(float fadetime)
{
	// メモリの確保
	CTitle_PressEnter* pScreen = DEBUG_NEW CTitle_PressEnter(fadetime);

	if (pScreen != nullptr)
	{
		// 初期化処理
		pScreen->Init();
	}

	return pScreen;
}

//==========================================================================
// 初期化処理
//==========================================================================
HRESULT CTitle_PressEnter::Init()
{
	// 初期化処理
	HRESULT hr = CObject2D::Init();
	if (FAILED(hr))
	{// 失敗したとき
		return E_FAIL;
	}

	// 種類の設定
	SetType(TYPE_OBJECT2D);

	// テクスチャの割り当て
	int nIdx = CTexture::GetInstance()->Regist(TEXTURE);
	BindTexture(nIdx);

	D3DXVECTOR2 size = CTexture::GetInstance()->GetImageSize(nIdx);
	size = UtilFunc::Transformation::AdjustSizeByWidth(size, 250.0f);

	// サイズ設定
	SetSize(size);
	SetSizeOrigin(GetSize());

	// 位置設定
	SetPosition(MyLib::Vector3(SCREEN_WIDTH * 0.5f, 600.0f, 0.0f));

	// 色設定
	SetColor(D3DXCOLOR(1.0f, 1.0f, 1.0f, 0.0f));

	// 状態カウンター
	m_fStateTime = m_fFadeOutTime;
	m_state = STATE_FADEIN;
	return S_OK;
}

//==========================================================================
// 更新処理
//==========================================================================
void CTitle_PressEnter::Update()
{
	if (CManager::GetInstance()->GetFade()->GetState() != CFade::STATE_NONE)
	{// フェード中は抜ける
		return;
	}

	// 状態別更新処理
	(this->*(m_StateFunc[m_state]))();
	if (IsDeath())
	{
		return;
	}

	// 更新処理
	CObject2D::Update();
}

//==========================================================================
// なにもなし
//==========================================================================
void CTitle_PressEnter::StateNone()
{
	// 入力情報取得
	CInputKeyboard* pInputKeyboard = CManager::GetInstance()->GetInputKeyboard();
	CInputGamepad* pInputGamepad = CManager::GetInstance()->GetInputGamepad();

	if (pInputGamepad->GetTrigger(CInputGamepad::BUTTON::BUTTON_A, 0) ||
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON::BUTTON_B, 0) ||
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON::BUTTON_X, 0) ||
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON::BUTTON_Y, 0) ||
		pInputGamepad->GetTrigger(CInputGamepad::BUTTON::BUTTON_START, 0) ||
		pInputKeyboard->GetTrigger(DIK_RETURN) ||
		pInputKeyboard->GetTrigger(DIK_SPACE) ||
		pInputKeyboard->GetTrigger(DIK_BACKSPACE)
		)
	{
		CManager::GetInstance()->GetFade()->SetFade(CScene::MODE::MODE_GAME);
	}
}

//==========================================================================
// フェードイン
//==========================================================================
void CTitle_PressEnter::StateFadeIn()
{
	// 状態遷移カウンター減算
	m_fStateTime -= CManager::GetInstance()->GetDeltaTime();

	// 不透明度更新
	float alpha = 1.0f - (m_fStateTime / m_fFadeOutTime);
	SetAlpha(alpha);

	if (m_fStateTime <= 0.0f)
	{
		m_fStateTime = 0.0f;
		m_state = STATE_NONE;

		// 不透明度更新
		SetAlpha(1.0f);
		return;
	}
}

//==========================================================================
// チュートリアル確認のフェードアウト
//==========================================================================
void CTitle_PressEnter::StateTutorial_FadeOut()
{
	// 状態遷移カウンター加算
	m_fStateTime += CManager::GetInstance()->GetDeltaTime();

	float alpha = UtilFunc::Correction::EasingLinear(1.0f, 0.0f, 0.0f, TIME_TUTORIAL_FADEOUT, m_fStateTime);

	if (m_fStateTime >= TIME_TUTORIAL_FADEOUT)
	{
		m_fStateTime = 0.0f;
		m_state = STATE_NONE;
	}
}

//==========================================================================
// 状態設定
//==========================================================================
void CTitle_PressEnter::SetState(STATE state)
{
	m_state = state;
	m_fStateTime = 0.0f;
}