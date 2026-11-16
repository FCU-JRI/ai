/* 專案模型。從利害關係人開始，依序往下建立。 */
package Project {
    private import ScalarValues::*;
    private import ISQ::*;
    private import SI::*;
    private import JRI::*;

    package Stakeholders {
        part <'STK-001'> 'JRI 專案團隊' : Stakeholder {
            doc /* 設計、製造並操作本系統的學生團隊，包含總工程師暨隊長、副社長暨營運長、各組組長暨責任工程師與核心成員。對任務成敗負責，也是系統的直接操作者。出處：AEAS 工程指導原則第 4 章；競賽規則說明 v3「活動組別、參賽資格」共同性規定（每隊設隊長、副隊長）。 */
            :>> role = "任務成功、成員取得完整的實作經驗";
        }
        part <'STK-002'> '酬載提案委員會' : Stakeholder {
            doc /* 酬載任務的提出者，代表液體動力實驗的使用者。定義要量測什麼、量到什麼程度才算成功，並在任務結束後使用取得的數據。出處：總工程師確認（2026-11-15）；酬載內容見研究計畫書（預覽 V2）。 */
            :>> role = "取得可用於研究的飛行實驗數據";
        }
        part <'STK-003'> '指導員與 AEAS' : Stakeholder {
            doc /* 教職員顧問與管制官兩位指導員，以及制定工程指導原則與安全協議的 AEAS 工程委員會。測試與飛行須經其核可，發現安全隱患時得勒令停工。出處：AEAS 工程指導原則 4.1、4.3；AEAS 安全協議 4.2；競賽規則說明 v3「活動組別、參賽資格」共同性規定（指導員）。 */
            :>> role = "人員安全、開發過程依規範執行並可監督";
        }
        part <'STK-004'> '主辦單位' : Stakeholder {
            doc /* 國家太空中心與屏東縣政府主辦、國立陽明交通大學太空系統工程研究所承辦；制定競賽規則與火箭設計規範，並由其聘任的評審委員與發射許可審查委員評分及決定能否發射。出處：競賽規則說明 v3 第 2、27、32 頁。 */
            :>> role = "賽事安全順利、火箭符合規範、評分有客觀依據";
        }
        part <'STK-005'> '射場與回收作業人員' : Stakeholder {
            doc /* 決賽當天在火箭附近工作的人員：發射指揮官、安全指揮官、推進系統工作人員、射場環境組、射場管理組、醫護及消防人員，以及回收漁船與無人機人員。他們直接接觸或靠近火箭，承受作業風險。出處：競賽規則說明 v3 第 47、51、53 至 58 頁。 */
            :>> role = "接觸火箭時處於安全狀態、異常時可處置";
        }
        part <'STK-006'> '主管機關' : Stakeholder {
            doc /* 與本任務有關的法規主管機關：國家科學及技術委員會（太空發展法第 2 條）、國家通訊傳播委員會（電信管理法第 2 條）、海洋委員會（海洋污染防治法第 3 條）、環境部（廢棄物清理法第 4 條）、勞動部（職業安全衛生法第 3 條）。個別條文在系統層需求以出處標註。 */
            :>> role = "活動合法、不危及公眾與環境";
        }
        part <'STK-007'> '贊助者' : Stakeholder {
            doc /* 以資金、物料或場地支持專案的單位，依贊助級距取得品牌曝光。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：JRI Project 2026 贊助簡報第 12 至 19 頁；AEAS 工程指導原則 4.5。 */
            :>> role = "品牌曝光、資源用於火箭";
        }
        requirement <'EXP-001'> '任務達成完全成功' : Expectation {
            doc /* 通過各階段審查與發射許可審查，火箭順利升空並回收，且取回飛行數據、酬載數據與箭載影像。團隊對任務成敗負最終責任。出處：第一版模型 EXP-001（總工程師）；順利升空的判定見競賽規則說明 v3 第 6 頁。 */
        }
        requirement <'EXP-002'> '成員累積完整的實作經驗' : Expectation {
            doc /* 成員投入大量時間，希望完整經歷所屬分系統從設計、製造到測試的過程。出處：第一版模型 EXP-006。 */
        }
        requirement <'EXP-003'> '取得可呈現成果的飛行影像' : Expectation {
            doc /* 箭載與地面影像是最能呈現團隊工程成果的素材，用於對外宣傳與招募。出處：第一版模型 EXP-007（業務發展組）。 */
        }
        requirement <'EXP-004'> '取得引擎關閉時液體前衝的飛行數據' : Expectation {
            doc /* 地面試驗難以重現飛行中連續變化的加速度。數據要有足夠的取樣率與精度，並與飛行數據時間同步，才能用於研究。出處：第一版模型 EXP-008；研究計畫書（預覽 V2）。 */
        }
        requirement <'EXP-005'> '無人員受傷' : Expectation {
            doc /* 從製造、測試到發射的所有作業都不造成人員傷害；危險作業開始前，程序已經過審核。出處：AEAS 安全協議 1.1；第一版模型 EXP-003。 */
        }
        requirement <'EXP-006'> '開發依指導原則執行且可監督' : Expectation {
            doc /* 開發依工程指導原則的開發週期與審查程序進行，指導員在各審查節點能掌握狀態並決定是否放行。出處：AEAS 工程指導原則 1.2、5.3、6.2；第一版模型 EXP-004。 */
        }
        requirement <'EXP-007'> '火箭符合設計規範並通過發射許可審查' : Expectation {
            doc /* 火箭符合火箭設計規範，發射前的問題已釐清，並在審查時間內通過發射許可審查。出處：競賽規則說明 v3 第 6、11 頁。 */
        }
        requirement <'EXP-008'> '發射與回收全程安全' : Expectation {
            doc /* 火箭維持箭體完整朝海面飛行並落於指定的安全回收區，不危及射場人員、觀眾與周邊。出處：競賽規則說明 v3 第 6、58 頁。 */
        }
        requirement <'EXP-009'> '成果可依評分表客觀評分' : Expectation {
            doc /* 各階段報告、海報與決賽飛行結果，提供足以對照評分表給分的內容與數據。出處：競賽規則說明 v3 第 27、28 頁。 */
        }
        requirement <'EXP-010'> '接觸火箭時火箭處於已知的安全狀態' : Expectation {
            doc /* 安裝或移除點火器、上架與打撈時，作業人員能確認火箭的儲能裝置與點火線路處於安全狀態。出處：競賽規則說明 v3 第 47、55、58 頁；第一版模型 EXP-013、EXP-016。 */
        }
        requirement <'EXP-011'> '火箭落海後可被找到並打撈' : Expectation {
            doc /* 火箭落海後持續漂浮，回收漁船與無人機能依定位訊號找到並打撈。出處：競賽規則說明 v3 第 53 頁。 */
        }
        requirement <'EXP-012'> '活動合法且不危及公眾與環境' : Expectation {
            doc /* 發射不危及公共安全，無線電使用合法，不在海中遺留廢棄物或有害物質，化學品與廢棄物依規定管理。個別條文在系統層需求列出。出處：太空發展法第 7、11 條；電信管理法；海洋污染防治法第 4 條；廢棄物清理法第 28 條；職業安全衛生法第 6 條。 */
        }
        requirement <'EXP-013'> '商標在箭體與發射影像中可見' : Expectation {
            doc /* 箭身印製贊助者商標，發射活動的拍攝紀錄產出品牌可見的影片與素材。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：JRI Project 2026 贊助簡報第 17 頁。 */
        }
    }

    package NGOs {
        requirement <'NEED-001'> '完成學生自製探空火箭的液體前衝飛行實驗' : Need {
            doc /* JRI 需要完成一次由學生自行開發的探空火箭飛行實驗，取得引擎關閉時液體前衝的飛行量測數據。安全、合規與影像是達成這項需要時必須同時滿足的條件，寫在目標。 */
        }
        requirement <'GOAL-001'> '完成飛行並取回液體前衝實驗數據' : Goal {
            doc /* 以團隊自行設計、製造與測試的火箭完成一次飛行，經歷引擎關閉，落海後被找到並打撈，取回可用於研究的液體前衝量測數據與飛行數據。 */
        }
        requirement <'GOAL-002'> '所有作業與飛行全程安全' : Goal {
            doc /* 從製造、測試、發射到打撈，不造成人員傷害；有人接觸火箭時，火箭處於可確認的安全狀態；飛行與落點不危及射場人員、觀眾與周邊。 */
        }
        requirement <'GOAL-003'> '依規範開發並通過各階段審查' : Goal {
            doc /* 開發過程依 AEAS 工程指導原則進行，指導員在各審查節點能掌握狀態；火箭符合火箭設計規範與相關法規，並通過發射許可審查。 */
        }
        requirement <'GOAL-004'> '留下可評分且可呈現的成果' : Goal {
            doc /* 各階段報告、海報與決賽飛行結果足以對照評分表給分；取得箭載與地面影像，贊助者商標在箭體與影像中可見。 */
        }
        requirement <'OBJ-001'> '火箭順利升空並到達 3 公里以上' : Objective {
            doc /* 火箭維持箭體完整朝海面向上飛行，飛行高度達 3 公里以上，並落於指定的安全回收區。出處：競賽規則說明 v3 第 3 頁（學生 3K 組）、第 6 頁（順利升空的判定）、第 52 頁（安全回收區）。 */
        }
        requirement <'OBJ-002'> '降落傘依序開啟，火箭完整落海' : Objective {
            doc /* 火箭於空中開啟降落傘：3K 組為雙階段降落傘，第二階段於離地 500 公尺以下啟動；落海時箭體完整。出處：競賽規則說明 v3 第 5 頁、第 31 頁（發射許可審查表「火箭降落終端速度」）。 */
        }
        requirement <'OBJ-003'> '火箭落海後漂浮並被打撈' : Objective {
            doc /* 火箭落海後具長時間漂浮能力，回收漁船依定位訊號找到並打撈。出處：競賽規則說明 v3 第 5、53 頁。 */
        }
        requirement <'OBJ-004'> '取回四項基本飛行數據' : Objective {
            doc /* 記錄並取回飛行高度、飛行速度、飛行加速度與 GPS 軌跡四項基本飛行數據。出處：競賽規則說明 v3 第 5 頁。 */
        }
        requirement <'OBJ-005'> '取回達完全成功標準的液體前衝數據' : Objective {
            doc /* 取回前衝與撞擊後的影像、與影像時間同步的軸向加速度，以及三軸角速度與橫向加速度，達研究計畫書所訂的完全成功標準。出處：研究計畫書（預覽 V2）7.3 節。 */
        }
        requirement <'OBJ-006'> '全程無人員受傷' : Objective {
            doc /* 從製造、測試、發射到打撈，人員受傷件數為零。出處：AEAS 安全協議 1.1；期望 EXP-005。 */
        }
        requirement <'OBJ-007'> '有人接觸火箭時火箭處於可確認的安全狀態' : Objective {
            doc /* 安裝或移除點火器、上架與打撈時，作業人員能確認火箭的儲能裝置與點火線路處於安全狀態。出處：競賽規則說明 v3 第 47、55、58 頁。 */
        }
        requirement <'OBJ-008'> '通過發射許可審查全部項目' : Objective {
            doc /* 發射許可審查共 25 項，於審查時間（含展延）內全數取得核可。火箭設計規範的條文由這項目的承接。出處：競賽規則說明 v3 第 6、31 頁。 */
        }
        requirement <'OBJ-009'> '各審查節點都取得核可' : Objective {
            doc /* MDR、PDR、CDR、TRR、FRR 各審查節點，都取得工程指導原則所定核可者的核可。出處：AEAS 工程指導原則 5.3、6.2.2。 */
        }
        requirement <'OBJ-010'> '活動全程符合適用法規' : Objective {
            doc /* 發射、無線電使用、海洋污染防治、廢棄物清理與化學品管理，均無違反法規的情事。適用條文在系統層需求列出。出處：太空發展法、電信管理法、海洋污染防治法、廢棄物清理法、職業安全衛生法。 */
        }
        requirement <'OBJ-011'> '取得發射至落海的飛行影像' : Objective {
            doc /* 取得發射至落海的箭載影像，以及火箭離架過程的地面影像。出處：第一版模型 OBJ-008、OBJ-010。 */
        }
        requirement <'OBJ-012'> '贊助者商標在箭體與發射影像中可辨識' : Objective {
            doc /* 箭身印有贊助者商標，且在發射影像中可辨識。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：JRI Project 2026 贊助簡報第 17 頁。 */
        }
        requirement <'MOE-001'> '飛行最高高度' : MOE {
            doc /* 火箭飛行的最高高度應達 3 公里以上。量測方式：以取回的飛行數據高度紀錄判定。出處：競賽規則說明 v3 第 3 頁。 */
        }
        requirement <'MOE-002'> '觸水終端速度' : MOE {
            doc /* 火箭觸水時的下降速率應小於 12 m/s。量測方式：以取回的飛行數據判定。出處：火箭設計規範 4.2.4；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'MOE-003'> '火箭回收結果' : MOE {
            doc /* 火箭落海後應由回收船打撈上船。量測方式：以決賽當日的回收結果判定是／否。出處：競賽規則說明 v3 第 5、53 頁。 */
        }
        requirement <'MOE-004'> '基本飛行數據取回項數' : MOE {
            doc /* 飛行高度、飛行速度、飛行加速度與 GPS 軌跡四項，取回項數應為 4 項。量測方式：飛行後檢查取回的紀錄。出處：競賽規則說明 v3 第 5 頁。 */
        }
        requirement <'MOE-005'> '液體前衝實驗成功等級' : MOE {
            doc /* 取回的資料應達完全成功：前衝與撞擊後的影像、與影像時間同步的軸向加速度、三軸角速度與橫向加速度都取得。量測方式：依研究計畫書所列的最低成功、部分成功、完全成功三級判定。出處：研究計畫書（預覽 V2）7.3 節。 */
        }
        requirement <'MOE-006'> '人員受傷件數' : MOE {
            doc /* 從製造、測試、發射到打撈，人員受傷件數應為 0。量測方式：以事故通報紀錄判定。出處：AEAS 安全協議 1.1。 */
        }
        requirement <'MOE-007'> '儲能裝置未經指示進入啟動狀態的次數' : MOE {
            doc /* 儲能裝置在火箭處於發射位置並經發射許可審查委員指示前，應維持安全狀態；未經指示進入啟動狀態的次數應為 0。量測方式：以測試與決賽的作業紀錄判定。出處：火箭設計規範 4.6.3 至 4.6.5。 */
        }
        requirement <'MOE-008'> '發射許可審查核可項數' : MOE {
            doc /* 發射許可審查核可項數應為 25 項全數。量測方式：以發射許可審查表的簽核結果判定。出處：競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'MOE-009'> '審查節點核可比例' : MOE {
            doc /* MDR、PDR、CDR、TRR、FRR 各審查節點中，取得核可的比例應為 100%。量測方式：查核審查紀錄。出處：AEAS 工程指導原則 5.3、6.2.2。 */
        }
        requirement <'MOE-010'> '違反法規件數' : MOE {
            doc /* 受主管機關裁處或通知限期改善的件數應為 0。量測方式：以主管機關的來文判定。出處：太空發展法、電信管理法、海洋污染防治法、廢棄物清理法、職業安全衛生法。 */
        }
        requirement <'MOE-011'> '飛行影像涵蓋範圍' : MOE {
            doc /* 箭載影像應涵蓋發射至落海，地面影像應涵蓋火箭離架過程。量測方式：檢視取回的影像，兩項都達成才算達成。出處：第一版模型 MOE-013、MOE-014。 */
        }
        requirement <'MOE-012'> '商標在發射影像中的辨識結果' : MOE {
            doc /* 箭身印製的贊助者商標，應在發射活動的影像中可辨識。量測方式：檢視影像判定是／否。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：JRI Project 2026 贊助簡報第 17 頁。 */
        }
    }
    #trace dependency from Project::Stakeholders::'任務達成完全成功' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::Stakeholders::'成員累積完整的實作經驗' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::Stakeholders::'取得可呈現成果的飛行影像' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::Stakeholders::'取得引擎關閉時液體前衝的飛行數據' to Project::Stakeholders::'酬載提案委員會';
    #trace dependency from Project::Stakeholders::'無人員受傷' to Project::Stakeholders::'指導員與 AEAS';
    #trace dependency from Project::Stakeholders::'開發依指導原則執行且可監督' to Project::Stakeholders::'指導員與 AEAS';
    #trace dependency from Project::Stakeholders::'火箭符合設計規範並通過發射許可審查' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::Stakeholders::'發射與回收全程安全' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::Stakeholders::'成果可依評分表客觀評分' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::Stakeholders::'接觸火箭時火箭處於已知的安全狀態' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::Stakeholders::'火箭落海後可被找到並打撈' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::Stakeholders::'活動合法且不危及公眾與環境' to Project::Stakeholders::'主管機關';
    #trace dependency from Project::Stakeholders::'商標在箭體與發射影像中可見' to Project::Stakeholders::'贊助者';
    #trace dependency from Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗' to Project::Stakeholders::'任務達成完全成功';
    #trace dependency from Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗' to Project::Stakeholders::'成員累積完整的實作經驗';
    #trace dependency from Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗' to Project::Stakeholders::'取得引擎關閉時液體前衝的飛行數據';
    #derive dependency from Project::NGOs::'完成飛行並取回液體前衝實驗數據' to Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗';
    #derive dependency from Project::NGOs::'所有作業與飛行全程安全' to Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗';
    #derive dependency from Project::NGOs::'依規範開發並通過各階段審查' to Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗';
    #derive dependency from Project::NGOs::'留下可評分且可呈現的成果' to Project::NGOs::'完成學生自製探空火箭的液體前衝飛行實驗';
    #trace dependency from Project::NGOs::'完成飛行並取回液體前衝實驗數據' to Project::Stakeholders::'火箭落海後可被找到並打撈';
    #trace dependency from Project::NGOs::'所有作業與飛行全程安全' to Project::Stakeholders::'無人員受傷';
    #trace dependency from Project::NGOs::'所有作業與飛行全程安全' to Project::Stakeholders::'發射與回收全程安全';
    #trace dependency from Project::NGOs::'所有作業與飛行全程安全' to Project::Stakeholders::'接觸火箭時火箭處於已知的安全狀態';
    #trace dependency from Project::NGOs::'依規範開發並通過各階段審查' to Project::Stakeholders::'開發依指導原則執行且可監督';
    #trace dependency from Project::NGOs::'依規範開發並通過各階段審查' to Project::Stakeholders::'火箭符合設計規範並通過發射許可審查';
    #trace dependency from Project::NGOs::'依規範開發並通過各階段審查' to Project::Stakeholders::'活動合法且不危及公眾與環境';
    #trace dependency from Project::NGOs::'留下可評分且可呈現的成果' to Project::Stakeholders::'取得可呈現成果的飛行影像';
    #trace dependency from Project::NGOs::'留下可評分且可呈現的成果' to Project::Stakeholders::'成果可依評分表客觀評分';
    #trace dependency from Project::NGOs::'留下可評分且可呈現的成果' to Project::Stakeholders::'商標在箭體與發射影像中可見';
    #derive dependency from Project::NGOs::'火箭順利升空並到達 3 公里以上' to Project::NGOs::'完成飛行並取回液體前衝實驗數據';
    #derive dependency from Project::NGOs::'降落傘依序開啟，火箭完整落海' to Project::NGOs::'完成飛行並取回液體前衝實驗數據';
    #derive dependency from Project::NGOs::'火箭落海後漂浮並被打撈' to Project::NGOs::'完成飛行並取回液體前衝實驗數據';
    #derive dependency from Project::NGOs::'取回四項基本飛行數據' to Project::NGOs::'完成飛行並取回液體前衝實驗數據';
    #derive dependency from Project::NGOs::'取回達完全成功標準的液體前衝數據' to Project::NGOs::'完成飛行並取回液體前衝實驗數據';
    #derive dependency from Project::NGOs::'全程無人員受傷' to Project::NGOs::'所有作業與飛行全程安全';
    #derive dependency from Project::NGOs::'有人接觸火箭時火箭處於可確認的安全狀態' to Project::NGOs::'所有作業與飛行全程安全';
    #derive dependency from Project::NGOs::'通過發射許可審查全部項目' to Project::NGOs::'依規範開發並通過各階段審查';
    #derive dependency from Project::NGOs::'各審查節點都取得核可' to Project::NGOs::'依規範開發並通過各階段審查';
    #derive dependency from Project::NGOs::'活動全程符合適用法規' to Project::NGOs::'依規範開發並通過各階段審查';
    #derive dependency from Project::NGOs::'取得發射至落海的飛行影像' to Project::NGOs::'留下可評分且可呈現的成果';
    #derive dependency from Project::NGOs::'贊助者商標在箭體與發射影像中可辨識' to Project::NGOs::'留下可評分且可呈現的成果';
    #refine dependency from Project::NGOs::'飛行最高高度' to Project::NGOs::'火箭順利升空並到達 3 公里以上';
    #refine dependency from Project::NGOs::'觸水終端速度' to Project::NGOs::'降落傘依序開啟，火箭完整落海';
    #refine dependency from Project::NGOs::'火箭回收結果' to Project::NGOs::'火箭落海後漂浮並被打撈';
    #refine dependency from Project::NGOs::'基本飛行數據取回項數' to Project::NGOs::'取回四項基本飛行數據';
    #refine dependency from Project::NGOs::'液體前衝實驗成功等級' to Project::NGOs::'取回達完全成功標準的液體前衝數據';
    #refine dependency from Project::NGOs::'人員受傷件數' to Project::NGOs::'全程無人員受傷';
    #refine dependency from Project::NGOs::'儲能裝置未經指示進入啟動狀態的次數' to Project::NGOs::'有人接觸火箭時火箭處於可確認的安全狀態';
    #refine dependency from Project::NGOs::'發射許可審查核可項數' to Project::NGOs::'通過發射許可審查全部項目';
    #refine dependency from Project::NGOs::'審查節點核可比例' to Project::NGOs::'各審查節點都取得核可';
    #refine dependency from Project::NGOs::'違反法規件數' to Project::NGOs::'活動全程符合適用法規';
    #refine dependency from Project::NGOs::'飛行影像涵蓋範圍' to Project::NGOs::'取得發射至落海的飛行影像';
    #refine dependency from Project::NGOs::'商標在發射影像中的辨識結果' to Project::NGOs::'贊助者商標在箭體與發射影像中可辨識';
}
