//=============================================================================
// 
//  スコアヘッダー [resultscore.h]
//  Author : ��田佳依
// 
//=============================================================================

#ifndef _BATTLERESULT_H_
#define _BATTLERESULT_H_	// 二重インクルード防止

#include "object2d.h"
#include "multinumber.h"

//==========================================================================
// クラス定義
//==========================================================================
// 戦果クラス
class CResultScore : public CObject
{
public:

	CResultScore(int nPriority = 8);
	~CResultScore();

	// オーバーライドされた関数
	HRESULT Init() override;
	void Uninit() override;
	void Update() override;
	void Draw() override;

	void Kill();	// 削除
	static CResultScore* Create();	// 生成処理

private:

	//=============================
	// メンバ関数
	//=============================
	void CreateScore();

	//=============================
	// メンバ変数
	//=============================
	CMultiNumber* m_pScore;			// 生成数スコア

};


#endif