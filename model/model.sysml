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
}
