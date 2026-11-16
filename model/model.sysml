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

    package Structure {
        part def <'SYS-001'> '探空火箭系統' :> System {
            doc /* 團隊設計與製造的系統：火箭本體，以及團隊自製的地面支援設備。公版發動機、公版 GPS 追蹤器、公版軌道滑塊與發射架由主辦單位提供，不在系統內；團隊負責與它們相接的介面。出處：競賽規則說明 v3 第 5 頁；第一版模型 SYS-001。 */
        }
        part def <'EXT-001'> '公版發動機 Pioneer-10K' :> ExternalEntity {
            doc /* 3K 組統一使用的公版固態火箭發動機，以 8 支 M5 螺絲鎖固在火箭內，提供推力；點火器與點火線路由競賽工作人員安裝。出處：火箭設計規範 3.2；競賽規則說明 v3 第 41、42 頁。 */
        }
        part def <'EXT-002'> '公版 GPS 追蹤器' :> ExternalEntity {
            doc /* 3K 組必須搭載的公版追蹤酬載，裝在火箭內，落海後發出定位訊號供回收船尋找。出處：火箭設計規範 2.2、5.1；競賽規則說明 v3 第 46、53 頁。 */
        }
        part def <'EXT-003'> '公版軌道滑塊' :> ExternalEntity {
            doc /* 主辦單位提供的軌道滑塊零件，固定在箭身上，將火箭連接到發射架軌道。出處：火箭設計規範 6.3。 */
        }
        part def <'EXT-004'> '公版發射架' :> ExternalEntity {
            doc /* 主辦單位提供的發射架，軌道總長 4 公尺，導引火箭離架。出處：火箭設計規範 9.1。 */
        }
        part def <'EXT-005'> '審查委員與射場工作人員' :> ExternalEntity {
            doc /* 發射許可審查委員與競賽工作人員：檢查、秤重並量測火箭，指示儲能裝置啟動，安裝與移除點火器。出處：火箭設計規範 3.2.7、4.6.5；競賽規則說明 v3 第 31、47、58 頁。 */
        }
        part def <'EXT-006'> '回收船與無人機' :> ExternalEntity {
            doc /* 主辦單位安排的回收漁船與無人機，依定位訊號找到落海的火箭並打撈。出處：競賽規則說明 v3 第 52、53 頁。 */
        }
        part def <'EXT-007'> '團隊操作人員' :> ExternalEntity {
            doc /* 在測試與決賽時組裝、上架、上電並操作本系統的 JRI 成員。出處：競賽規則說明 v3 第 47 頁。 */
        }
        part def <'EXT-008'> '大氣與海面環境' :> ExternalEntity {
            doc /* 飛行中的大氣與風場，以及落海後的海水與海況。固定風速達每秒 6 公尺以上不符合發射條件。出處：競賽規則說明 v3 第 55 頁。 */
        }
        part def '任務脈絡' {
            doc /* 系統脈絡：探空火箭系統與它互動的外部對象。連線表示兩者之間有實體、訊號或操作上的互動。 */
            part '探空火箭系統' : Project::Structure::'探空火箭系統';
            part '公版發動機 Pioneer-10K' : Project::Structure::'公版發動機 Pioneer-10K';
            part '公版 GPS 追蹤器' : Project::Structure::'公版 GPS 追蹤器';
            part '公版軌道滑塊' : Project::Structure::'公版軌道滑塊';
            part '公版發射架' : Project::Structure::'公版發射架';
            part '審查委員與射場工作人員' : Project::Structure::'審查委員與射場工作人員';
            part '回收船與無人機' : Project::Structure::'回收船與無人機';
            part '團隊操作人員' : Project::Structure::'團隊操作人員';
            part '大氣與海面環境' : Project::Structure::'大氣與海面環境';
            connect '探空火箭系統' to '公版發動機 Pioneer-10K';
            connect '探空火箭系統' to '公版 GPS 追蹤器';
            connect '探空火箭系統' to '公版軌道滑塊';
            connect '公版軌道滑塊' to '公版發射架';
            connect '探空火箭系統' to '審查委員與射場工作人員';
            connect '審查委員與射場工作人員' to '公版發動機 Pioneer-10K';
            connect '探空火箭系統' to '回收船與無人機';
            connect '公版 GPS 追蹤器' to '回收船與無人機';
            connect '探空火箭系統' to '團隊操作人員';
            connect '探空火箭系統' to '大氣與海面環境';
        }
    }

    package Behavior {
        action <'PH-001'> '總任務：2027 台灣盃探空火箭飛行任務' : MissionPhase {
            doc /* 從火箭運抵射場到取回數據的一次完整任務，依序經過十個階段。地面測試屬於開發期間，不在任務階段內；中止發射是異常分支（使用案例 UC-010），不在正常順序內。 */
            action <'PH-002'> '運送' : MissionPhase {
                doc /* 起：火箭與設備在臺中市西屯區裝載出發。迄：抵達屏東縣旭海，完成到場檢查。對應使用案例 UC-002。出處：總工程師確認（2026-11-16）。 */
            }
            action <'PH-003'> '發射許可審查' : MissionPhase {
                doc /* 起：決賽第一天發射許可審查初審開始。迄：第二天複審完成，火箭放置於組裝整備區。對應使用案例 UC-003。出處：競賽規則說明 v3 第 30、31、37、47 頁。 */
            }
            action <'PH-004'> '組裝整備' : MissionPhase {
                doc /* 起：所屬發射輪的上架備便審查開始。迄：公版發動機安裝完成。團隊可用時間與上架備便合計 50 分鐘。對應使用案例 UC-004。出處：競賽規則說明 v3 第 36、47、51 頁。 */
            }
            action <'PH-005'> '上架備便' : MissionPhase {
                doc /* 起：火箭滑上發射架。迄：點火。期間上電確認、依指示啟動儲能裝置、完成上架備便審查、人員撤離、競賽工作人員安裝點火器並倒數。對應使用案例 UC-005。出處：競賽規則說明 v3 第 36、47、54 頁；火箭設計規範 4.6.5。 */
            }
            action <'PH-006'> '推進段' : MissionPhase {
                doc /* 起：點火，火箭離架。迄：固體馬達燃盡。推力大於阻力，酬載容器內的液體沉降於後端。對應使用案例 UC-006。出處：研究計畫書（預覽 V2）1.3 節；競賽規則說明 v3 第 54 頁。 */
            }
            action <'PH-007'> '滑行段' : MissionPhase {
                doc /* 起：固體馬達燃盡。迄：火箭到達最高點。包含推力尾段與阻力主導的滑行；液體前衝實驗在這個階段進行。對應使用案例 UC-006、UC-007。出處：研究計畫書（預覽 V2）1.3 節。 */
            }
            action <'PH-008'> '減速傘下降' : MissionPhase {
                doc /* 起：火箭到達最高點，開啟減速傘。迄：主降落傘開啟。對應使用案例 UC-006。出處：火箭設計規範 4.2.2.4。 */
            }
            action <'PH-009'> '主傘下降' : MissionPhase {
                doc /* 起：主降落傘在離地 500 公尺以下開啟。迄：火箭落海，觸水終端速度小於 12 m/s。對應使用案例 UC-006。出處：火箭設計規範 4.2.2.4、4.2.4；競賽規則說明 v3 第 31 頁。 */
            }
            action <'PH-010'> '漂浮與打撈' : MissionPhase {
                doc /* 起：火箭落海。迄：回收漁船把火箭打撈上船並運回旭海集會所。對應使用案例 UC-008。出處：競賽規則說明 v3 第 52、53 頁。 */
            }
            action <'PH-011'> '數據取回' : MissionPhase {
                doc /* 起：火箭交還團隊。迄：飛行數據、酬載數據與影像讀出，並完成影像與慣性資料的對時。對應使用案例 UC-009。出處：競賽規則說明 v3 第 5 頁；研究計畫書（預覽 V2）4.7 節。 */
            }
            first '運送' then '發射許可審查';
            first '發射許可審查' then '組裝整備';
            first '組裝整備' then '上架備便';
            first '上架備便' then '推進段';
            first '推進段' then '滑行段';
            first '滑行段' then '減速傘下降';
            first '減速傘下降' then '主傘下降';
            first '主傘下降' then '漂浮與打撈';
            first '漂浮與打撈' then '數據取回';
        }
    }

    package UseCases {
        use case <'UC-001'> '執行地面測試' : UseCase {
            doc /* 參與者：JRI 專案團隊、指導員與 AEAS。前置條件：測試程序已通過測試準備審查（TRR），取得指導原則所定核可者的核可。主要流程：(1) 團隊在適當地點架設待測的系統，有危險性的測試著安全防護裝備並由指導員監督；(2) 在模擬觸發條件的環境下測試啟動回收系統的感測器，並測試回收系統的釋放機制；(3) 確認酬載的量測系統在飛行前可正常運作；(4) 記錄測試影片與結果。結束狀態：測試無重大異常，影片與結果可放進設計審查報告。出處：火箭設計規範 4.5.1 至 4.5.4；AEAS 工程指導原則 5.3、6.2.2；研究計畫書（預覽 V2）4.5 節。 */
        }
        use case <'UC-002'> '運送火箭到射場' : UseCase {
            doc /* 參與者：JRI 專案團隊。前置條件：火箭與地面設備已完成製造與測試。主要流程：(1) 團隊把火箭、地面設備與自備的組裝放置架裝載上車；(2) 由臺中市西屯區運送到屏東縣旭海的發射場；(3) 抵達後檢查火箭與設備有無運送造成的損傷。結束狀態：火箭與設備完好抵達，可接受發射許可審查。運送方式與是否分段運送待團隊決定。出處：總工程師確認（2026-11-16）；競賽規則說明 v3 第 20、22 頁（次系統需求類別含運輸）、第 51 頁（自備火箭組裝放置架）。 */
        }
        use case <'UC-003'> '接受發射許可審查' : UseCase {
            doc /* 參與者：JRI 專案團隊、主辦單位（發射許可審查委員）。前置條件：火箭設計規格資料表、FRR、需求矩陣與檢查項目表已備妥，火箭已組裝完成。主要流程：(1) 文件審查 9 項；(2) 外觀審查 6 項：零件固定、外型、可滑動連接介面、軌道滑塊位置與固定方式、識別標記；(3) 重量審查 4 項：試組裝公版推進系統、秤起飛重量、吊掛量測質心位置；(4) 射場審查 3 項：現場演示回收系統釋放降落傘、公版 GPS 追蹤器回傳位置、火箭上架滑動。結束狀態：審查表各項取得核可簽名，火箭放置於組裝整備區等待上架備便審查。出處：競賽規則說明 v3 第 31、33、35、37 頁。 */
        }
        use case <'UC-004'> '在射場組裝並整備火箭' : UseCase {
            doc /* 參與者：JRI 專案團隊、主辦單位（發射許可審查委員）。前置條件：火箭已完成發射許可審查複審，放置於組裝整備區。主要流程：(1) 至多 5 名團隊成員進入組裝區，使用自備的組裝放置架；(2) 完成到發射場才做的簡易組裝；(3) 在上架備便審查開始後第 40 分鐘前開始安裝公版發動機，以 8 支 M5 螺絲鎖固。結束狀態：火箭組裝完成，可以上架。時間限制：上架備便審查每輪 1 小時，其中團隊可用 50 分鐘，其餘 10 分鐘為工作人員發射備便時間。出處：競賽規則說明 v3 第 36、37、47、51 頁；火箭設計規範 3.2.2。 */
        }
        use case <'UC-005'> '上架並進入備便' : UseCase {
            doc /* 參與者：JRI 專案團隊、主辦單位（發射許可審查委員）、射場與回收作業人員。前置條件：火箭已安裝公版發動機。主要流程：(1) 審查開始後第 45 分鐘前，團隊將火箭滑上發射架，非相關人員開始撤離；(2) 團隊由外部開關為航電上電，確認工作狀況與通訊接收，確認正常後不再下電；(3) 依發射許可審查委員指示，從外部將儲能裝置由安全狀態切換為啟動狀態，並在人員不靠近火箭 100 mm 範圍內的情況下確認狀態；(4) 第 50 分鐘前完成上架備便審查 3 項：火箭上架、火箭外觀、火箭航電功能；(5) 全員撤離後，競賽工作人員安裝點火器並連接點火線路。結束狀態：火箭在發射架上備便，等待倒數。出處：競賽規則說明 v3 第 31、36、47 頁；火箭設計規範 3.2.7、4.6.5 至 4.6.7。 */
        }
        use case <'UC-006'> '發射並完成飛行' : UseCase {
            doc /* 參與者：射場與回收作業人員、主辦單位。前置條件：火箭備便，推進系統、射場環境與射場管理三方的 Go-NoGo 確認通過。主要流程：(1) 發射指揮官倒數，競賽工作人員以公版地面發射控制系統點火；(2) 火箭沿發射架軌道離架並向海面上升；(3) 到達最高點時開啟減速傘；(4) 在較低高度開啟主降落傘；(5) 火箭落海；(6) 全程記錄飛行高度、飛行速度、飛行加速度與 GPS 軌跡。結束狀態：火箭維持箭體完整並落於安全回收區，飛行數據保存在箭上。出處：競賽規則說明 v3 第 5、6、52、54 頁；火箭設計規範 3.4.12、4.2.2.4。 */
        }
        use case <'UC-007'> '執行液體前衝實驗' : UseCase {
            doc /* 參與者：酬載提案委員會（實驗結果的使用者）。前置條件：酬載已上電並開始記錄，同步指示燈位於攝影機視野內。主要流程：(1) 資料記錄器在已知時刻點亮同步指示燈，並記錄點亮的時刻；(2) 酬載在發動機燃燒到關閉前後，連續拍攝容器內的液體，並記錄加速度與角速度；(3) 引擎關閉後，記錄液體前衝、撞擊端蓋與撞擊後的運動；(4) 資料保存在箭上直到火箭回收。結束狀態：影像與慣性資料完整保存，可依同步指示燈對齊時間。出處：研究計畫書（預覽 V2）4.7 節、7.3 節；火箭設計規範 7.1.1。 */
        }
        use case <'UC-008'> '落海後被尋獲並打撈' : UseCase {
            doc /* 參與者：射場與回收作業人員。前置條件：火箭已落海。主要流程：(1) 火箭漂浮於海面；(2) 公版 GPS 追蹤器持續發出定位訊號，回收漁船以 Beacon 收發裝置確認與火箭的相對位置；(3) 確認開傘後，無人機出發協助尋找；(4) 回收漁船接近並打撈，打撈人員能確認火箭處於安全狀態。結束狀態：火箭打撈上船，統一運回旭海集會所。出處：競賽規則說明 v3 第 52、53 頁；火箭設計規範 4.3.2、6.1.4；期望 EXP-010。 */
        }
        use case <'UC-009'> '取回數據與影像' : UseCase {
            doc /* 參與者：JRI 專案團隊、酬載提案委員會、主辦單位（評審委員）。前置條件：火箭已回收並交還團隊。主要流程：(1) 團隊由航電讀出飛行高度、飛行速度、飛行加速度與 GPS 軌跡；(2) 由酬載讀出前衝影像與慣性資料；(3) 讀出箭載影像；(4) 以同步指示燈首次亮起的影格，對齊影像與慣性資料的時間；(5) 整理成賽後紀錄，包含任務結果與預測和實測的比較。結束狀態：四項基本飛行數據、酬載數據與影像可供研究與評分使用。出處：競賽規則說明 v3 第 5、14 頁；研究計畫書（預覽 V2）4.7 節、7.3 節。 */
        }
        use case <'UC-010'> '中止發射並回到安全狀態' : UseCase {
            doc /* 參與者：JRI 專案團隊、射場與回收作業人員。觸發條件：火箭已上架但未能發射，或前一支火箭升空異常而比賽暫停。主要流程：(1) 發射指揮官暫停發射；(2) 競賽工作人員前往未發射的火箭移除點火器；(3) 團隊讓儲能裝置由啟動狀態回到安全狀態並確認；(4) 火箭留在架上等待重新排程，或下架。結束狀態：火箭處於安全狀態，可重新排入發射或撤回。規範沒有明訂儲能裝置解除啟動的程序，做法待團隊決定。出處：競賽規則說明 v3 第 37、58 頁；火箭設計規範 4.6.3 至 4.6.7。 */
        }
        use case <'UC-011'> '展示贊助商標並使用贊助材料' : UseCase {
            doc /* 參與者：贊助者、JRI 專案團隊。前置條件：贊助內容與商標位置已約定。主要流程：(1) 團隊把贊助者提供的產品、設備或原材料用於火箭的製造與測試；(2) 依贊助級距在箭身塗裝贊助者商標；(3) 火箭在海報展示、上架拍照與發射時展示商標；(4) 發射活動的拍攝紀錄留下商標可見的影片與素材。結束狀態：贊助材料已用在火箭上，商標在實體與影像中可見。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：總工程師確認（2026-11-16）；JRI Project 2026 贊助簡報第 17、19 頁；競賽規則說明 v3 第 30 頁（決賽時程）。 */
        }
    }

    package Requirements {
        requirement <'REQ-SYS-001'> '遠地點高度' : SystemRequirement {
            doc /* 火箭在發射仰角 84°±1°、朝正東方發射的條件下，飛行最高高度應達 3 公里以上。出處：競賽規則說明 v3 第 3 頁；火箭設計規範 8.1.1、8.1.3。 */
        }
        requirement <'REQ-SYS-002'> '起飛總重量' : SystemRequirement {
            doc /* 火箭含公版發動機 Pioneer-10K 的總重量應小於 28.5 kg。出處：火箭設計規範 3.2.4；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-003'> '飛行穩定性' : SystemRequirement {
            doc /* 火箭在飛行速度 0.3 馬赫以下且無側風的條件下，質心應位於壓力中心前方，間距應大於 2 倍且小於 4 倍箭身直徑；質心位置包含未燃燒的推進系統重量。出處：火箭設計規範 8.2.1.2、8.2.2；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-004'> '離架速度' : SystemRequirement {
            doc /* 火箭離架速度應大於發射場風速的 4 倍。以競賽規則的發射風速上限每秒 6 公尺換算，相當於離架速度大於 24 m/s；這個數值是換算結果，待飛行模擬確認。出處：火箭設計規範 8.2.3、9.1.2；競賽規則說明 v3 第 55 頁。 */
        }
        requirement <'REQ-SYS-005'> '落點範圍' : SystemRequirement {
            doc /* 火箭落點應位於主辦單位指定的安全回收區（A 至 G 點所圍區域）內。出處：火箭設計規範 4.3.3；競賽規則說明 v3 第 52 頁。 */
        }
        requirement <'REQ-SYS-006'> '結構完整性' : SystemRequirement {
            doc /* 火箭結構應在搬運、運輸與飛行期間保持完整。出處：火箭設計規範 6.1.2；競賽規則說明 v3 第 6 頁（順利升空以箭體完整判定）。 */
        }
        requirement <'REQ-SYS-007'> '雙階段降落傘回收' : SystemRequirement {
            doc /* 火箭應採用雙階段降落傘回收：到達最高點時開啟減速傘，離地 500 公尺以下開啟主降落傘。主降落傘的開傘高度由團隊決定。出處：火箭設計規範 4.2.2.4；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-008'> '降落觸水終端速度' : SystemRequirement {
            doc /* 火箭降落觸水時的下降速率應小於 12 m/s。出處：火箭設計規範 4.2.4；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-009'> '回收系統冗餘' : SystemRequirement {
            doc /* 航電啟動回收系統的部分與降落傘的釋放裝置，應具備獨立或冗餘的設計。出處：火箭設計規範 4.1.3、4.2.2.2；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-010'> '落海後漂浮' : SystemRequirement {
            doc /* 火箭整體結構落海後應漂浮於海面，浮力應大於火箭重量。未回收的火箭與零件在法律上屬海洋廢棄物。出處：火箭設計規範 6.1.4；競賽規則說明 v3 第 31 頁；海洋污染防治法第 4 條第 11 款。 */
        }
        requirement <'REQ-SYS-011'> '公版 GPS 追蹤器搭載' : SystemRequirement {
            doc /* 火箭應搭載公版 GPS 追蹤器，依附件十八設計組裝介面，使追蹤器正常運作並回傳火箭位置。出處：火箭設計規範 2.2、5.1.1、5.1.2；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-012'> '基本飛行數據記錄' : SystemRequirement {
            doc /* 系統應記錄飛行高度、飛行速度、飛行加速度與 GPS 軌跡，記錄範圍涵蓋點火至落海，並可在火箭回收後讀出。出處：火箭設計規範 2.1；競賽規則說明 v3 第 5 頁；第一版模型 MOE-006。 */
        }
        requirement <'REQ-SYS-013'> '電力持續時間' : SystemRequirement {
            doc /* 電池應能供應火箭系統正常運作 1.5 小時以上。出處：火箭設計規範 4.7.2；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-014'> '液體前衝實驗資料記錄' : SystemRequirement {
            doc /* 酬載應記錄液體前衝與撞擊後的影像、與影像共用時間基準的軸向加速度，以及三軸加速度與三軸角速度；記錄時間應涵蓋點火至頂點。影格率、取樣率與量程在次系統層需求訂定。出處：研究計畫書（預覽 V2）表 4-6、7.3 節。 */
        }
        requirement <'REQ-SYS-015'> '儲能裝置驅動方式' : SystemRequirement {
            doc /* 回收系統與酬載的儲能裝置應以氣瓶、機械能或其他非黑火藥的方式驅動。出處：火箭設計規範 4.6.2、7.1.2。 */
        }
        requirement <'REQ-SYS-016'> '儲能裝置遠離人員操作' : SystemRequirement {
            doc /* 儲能裝置的啟動與測試應能在無人員靠近火箭的情況下，由箭體外部控制。出處：火箭設計規範 4.6.6。 */
        }
        requirement <'REQ-SYS-017'> '儲能裝置安全狀態' : SystemRequirement {
            doc /* 儲能裝置處於安全狀態時，應需要兩個獨立的事件才能釋放能量，並保持安全狀態直到火箭在發射位置且經發射許可審查委員指示。出處：火箭設計規範 4.6.3、4.6.5。 */
        }
        requirement <'REQ-SYS-018'> '啟動狀態的確認方式' : SystemRequirement {
            doc /* 儲能裝置是否進入啟動狀態，應能在人員頭部與身體不進入火箭 100 mm 範圍內的情況下確認，例如聲音、指示燈或電腦連線。出處：火箭設計規範 4.6.7。 */
        }
        requirement <'REQ-SYS-019'> '解除啟動' : SystemRequirement {
            doc /* 火箭上架後未發射時，儲能裝置應能由啟動狀態回到安全狀態。這是由使用案例 UC-010 衍生的需求，設計規範沒有對應條文，做法待團隊決定。出處：使用案例 UC-010；競賽規則說明 v3 第 58 頁。 */
        }
        requirement <'REQ-SYS-020'> '外部上電' : SystemRequirement {
            doc /* 航電應能由箭體外部的開關上電啟動，並在火箭上架後確認工作狀況與通訊接收。出處：競賽規則說明 v3 第 36、37 頁。 */
        }
        requirement <'REQ-SYS-021'> '公版發動機安裝介面' : SystemRequirement {
            doc /* 火箭應能在發射前以 8 支 M5 螺絲鎖固公版發動機 Pioneer-10K，並具備至少 2 組位於發動機質心前方的定心環，使發動機安裝在火箭軸線上。出處：火箭設計規範 3.2.1.1、3.2.2、3.2.3；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-022'> '軌道滑塊配置' : SystemRequirement {
            doc /* 火箭應使用至少兩個公版軌道滑塊，分別位於重心上方與下方，且距火箭底部不超過 120 公分。出處：火箭設計規範 6.3.1、6.3.3、6.3.10；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-023'> '上架與滑動' : SystemRequirement {
            doc /* 火箭應能由公版發射架的導軌頂部水平裝載，並沿 4 公尺的 AF4040 軌道順利滑動。出處：火箭設計規範 9.1.2 至 9.1.4；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-024'> '與發射架無其他連接' : SystemRequirement {
            doc /* 除軌道滑塊外，火箭不得有任何線路或可分離接頭與發射架連接。出處：火箭設計規範 9.1.5；競賽規則說明 v3 第 31 頁。 */
        }
        requirement <'REQ-SYS-025'> '射場組裝與備便時間' : SystemRequirement {
            doc /* 系統應能在上架備便審查的 50 分鐘內完成到場組裝、公版發動機安裝、上架與備便；公版發動機的安裝應在第 40 分鐘前開始。出處：競賽規則說明 v3 第 36、47 頁。 */
        }
        requirement <'REQ-SYS-026'> '回收系統地面測試時點' : SystemRequirement {
            doc /* 回收系統的機制應在第二次設計審查報告（CDR）前完成關鍵子系統的地面測試，且無重大異常；啟動回收系統的感測器應在模擬觸發條件的環境下測試。出處：火箭設計規範 4.5.1、4.5.3。 */
        }
        requirement <'REQ-SYS-027'> '無線電頻率與功率' : SystemRequirement {
            doc /* 系統使用的無線電頻率與發射功率應符合國家通訊傳播委員會的技術規範：使用業餘無線電頻帶時，依業餘無線電機技術規範並持有對應等級的人員執照；使用免執照頻帶時，依低功率射頻器材技術規範。頻段尚未決定。出處：火箭設計規範 4.1.4.1、4.1.4.2、7.1.4；電信管理法第 51 條、第 52 條第 2 項。 */
        }
        requirement <'REQ-SYS-028'> '無線電頻道切換' : SystemRequirement {
            doc /* 系統的無線通訊應能切換到不同頻道，並在決賽前完成不同頻道的通訊測試，不干擾其他隊伍與合法通信。出處：火箭設計規範 4.1.4.3；電信管理法第 67 條。 */
        }
        requirement <'REQ-SYS-029'> '禁用有害配重' : SystemRequirement {
            doc /* 火箭不得使用鉛、汞、鈾等對環境有害的材料作為配重。出處：火箭設計規範 6.5.2；海洋污染防治法第 21 條。 */
        }
        requirement <'REQ-SYS-030'> '落海後不洩漏有害物質' : SystemRequirement {
            doc /* 火箭落海後，酬載液體、電池與其他內容物不得洩漏有害物質進入海洋。酬載液體尚未決定。出處：海洋污染防治法第 4 條第 1 款、第 21 條。 */
        }
        requirement <'REQ-SYS-031'> '箭載影像記錄' : SystemRequirement {
            doc /* 系統應記錄發射至落海的箭載影像，並可在火箭回收後讀出。出處：第一版模型 OBJ-008、MOE-013。 */
        }
        requirement <'REQ-SYS-032'> '贊助者商標塗裝' : SystemRequirement {
            doc /* 箭身應塗裝約定的贊助者商標，其位置不得遮蔽隊伍名稱、編號與翼片上的隊伍 ID，箭身主要顏色維持與天空成對比。依據為 2026 年度贊助簡報，2027 年度方案待確認。出處：JRI Project 2026 贊助簡報第 17 頁；火箭設計規範 6.4.1 至 6.4.4。 */
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
    #trace dependency from Project::UseCases::'執行地面測試' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'執行地面測試' to Project::Stakeholders::'指導員與 AEAS';
    #trace dependency from Project::UseCases::'運送火箭到射場' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'接受發射許可審查' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'接受發射許可審查' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::UseCases::'在射場組裝並整備火箭' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'在射場組裝並整備火箭' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::UseCases::'上架並進入備便' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'上架並進入備便' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::UseCases::'上架並進入備便' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::UseCases::'發射並完成飛行' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::UseCases::'發射並完成飛行' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::UseCases::'執行液體前衝實驗' to Project::Stakeholders::'酬載提案委員會';
    #trace dependency from Project::UseCases::'落海後被尋獲並打撈' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::UseCases::'取回數據與影像' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'取回數據與影像' to Project::Stakeholders::'酬載提案委員會';
    #trace dependency from Project::UseCases::'取回數據與影像' to Project::Stakeholders::'主辦單位';
    #trace dependency from Project::UseCases::'中止發射並回到安全狀態' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'中止發射並回到安全狀態' to Project::Stakeholders::'射場與回收作業人員';
    #trace dependency from Project::UseCases::'展示贊助商標並使用贊助材料' to Project::Stakeholders::'JRI 專案團隊';
    #trace dependency from Project::UseCases::'展示贊助商標並使用贊助材料' to Project::Stakeholders::'贊助者';
    #derive dependency from Project::Requirements::'遠地點高度' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'起飛總重量' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'飛行穩定性' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'離架速度' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'落點範圍' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'結構完整性' to Project::NGOs::'飛行最高高度';
    #derive dependency from Project::Requirements::'雙階段降落傘回收' to Project::NGOs::'觸水終端速度';
    #derive dependency from Project::Requirements::'降落觸水終端速度' to Project::NGOs::'觸水終端速度';
    #derive dependency from Project::Requirements::'回收系統冗餘' to Project::NGOs::'觸水終端速度';
    #derive dependency from Project::Requirements::'落海後漂浮' to Project::NGOs::'火箭回收結果';
    #derive dependency from Project::Requirements::'公版 GPS 追蹤器搭載' to Project::NGOs::'火箭回收結果';
    #derive dependency from Project::Requirements::'基本飛行數據記錄' to Project::NGOs::'基本飛行數據取回項數';
    #derive dependency from Project::Requirements::'電力持續時間' to Project::NGOs::'基本飛行數據取回項數';
    #derive dependency from Project::Requirements::'液體前衝實驗資料記錄' to Project::NGOs::'液體前衝實驗成功等級';
    #derive dependency from Project::Requirements::'儲能裝置驅動方式' to Project::NGOs::'人員受傷件數';
    #derive dependency from Project::Requirements::'儲能裝置遠離人員操作' to Project::NGOs::'人員受傷件數';
    #derive dependency from Project::Requirements::'儲能裝置安全狀態' to Project::NGOs::'儲能裝置未經指示進入啟動狀態的次數';
    #derive dependency from Project::Requirements::'啟動狀態的確認方式' to Project::NGOs::'儲能裝置未經指示進入啟動狀態的次數';
    #derive dependency from Project::Requirements::'解除啟動' to Project::NGOs::'儲能裝置未經指示進入啟動狀態的次數';
    #derive dependency from Project::Requirements::'外部上電' to Project::NGOs::'儲能裝置未經指示進入啟動狀態的次數';
    #derive dependency from Project::Requirements::'公版發動機安裝介面' to Project::NGOs::'發射許可審查核可項數';
    #derive dependency from Project::Requirements::'軌道滑塊配置' to Project::NGOs::'發射許可審查核可項數';
    #derive dependency from Project::Requirements::'上架與滑動' to Project::NGOs::'發射許可審查核可項數';
    #derive dependency from Project::Requirements::'與發射架無其他連接' to Project::NGOs::'發射許可審查核可項數';
    #derive dependency from Project::Requirements::'射場組裝與備便時間' to Project::NGOs::'發射許可審查核可項數';
    #derive dependency from Project::Requirements::'回收系統地面測試時點' to Project::NGOs::'審查節點核可比例';
    #derive dependency from Project::Requirements::'無線電頻率與功率' to Project::NGOs::'違反法規件數';
    #derive dependency from Project::Requirements::'無線電頻道切換' to Project::NGOs::'違反法規件數';
    #derive dependency from Project::Requirements::'禁用有害配重' to Project::NGOs::'違反法規件數';
    #derive dependency from Project::Requirements::'落海後不洩漏有害物質' to Project::NGOs::'違反法規件數';
    #derive dependency from Project::Requirements::'箭載影像記錄' to Project::NGOs::'飛行影像涵蓋範圍';
    #derive dependency from Project::Requirements::'贊助者商標塗裝' to Project::NGOs::'商標在發射影像中的辨識結果';
}
