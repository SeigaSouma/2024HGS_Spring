//=============================================================================
// 
//  かごヘッダー [busket.h]
//  Author : 石原颯馬
// 
//=============================================================================

#ifndef _BUSKET_H_
#define _BUSKET_H_	// 二重インクルード防止

#include "object.h"

//==========================================================================
// クラス定義
//==========================================================================
// 体力ゲージクラス定義
class CBusket : public CObject
{
public:

	CBusket(int nMaxPollen, int nPriority = mylib_const::PRIORITY_DEFAULT);
	~CBusket();

	static CBusket *Create(int nMaxPollen);

	// オーバーライドされた関数
	HRESULT Init();
	void Uninit();
	void Update();
	void Draw();

	//花粉減らす
	void Lost(void);
	void Boost(void);

	//取得
	int GetPollen(void) { return m_nPollen; }
	bool IsEmpty(void) { return m_bEmpty; }

private:
	int m_nPollen;				//現在の花粉量
	const int m_nMaxPollen;		//最大花粉量
	bool m_bEmpty;				//からっぽになったかどうか
};


#endif