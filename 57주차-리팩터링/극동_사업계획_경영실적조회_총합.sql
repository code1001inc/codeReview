

-- 계정과목 버전
WITH 
ACDMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.ACDEXT, B.ACDNAM, B.ADRCRD, B.ACDGBN                                                                                                                     
       , B.INPGBN, B.DELDAT, B.DISPGB, B.ACDEX1, B.ACDEX2, B.ACDEX3                                                                                                                               
       , B.ACDEX4, B.ACDEX5
        FROM ODDVER A
        LEFT JOIN ACDMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'ACDMST'
)
-- 제품마스터 버전                                                        			                                                                                                    
,JEPMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.JPCODE, B.JPNAME, B.NORMCD, B.ITMGBN                                                                                                                    
        , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
        , B.MANGER, B.JEPGB1, B.JEPGB2, B.JEPGB3, B.YAKKOR                                                                                                                              
        , B.JPNENG, B.YAKENG, B.OPTGBN, B.SETGBN, B.MDLGBN                                                                                                                              
        , B.MDLNAM, B.PUMNAM, B.BOMGBN, B.PROGBN, B.LOTGBN                                                                                                                              
        , B.SILGBN, B.CSTNAM, B.BUGAGB, B.COSTGB, B.CTBUGB                                                                                                                              
        , B.FILEGB, B.HANSAN, B.OUTGBN, B.PRODGB, B.PRODSP                                                                                                                              
        , B.REMARK   
        FROM ODDVER A
        LEFT JOIN JEPMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'JEPMST'
)  
-- 자재마스터 버전                                                                                                                                                                    
,MATMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.MATCOD, B.MATNAM, B.NORMCD, B.ITMGBN                                                                                                                    
           , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
           , B.MANGER, B.MAKERS, B.MODELS, B.MAJNAM, B.MATGB1                                                                                                                              
           , B.MATGB2, B.MATGB3, B.YAKKOR, B.MAPENG, B.YAKENG                                                                                                                              
           , B.OUTGBN, B.PRODGB, B.PRODSP, B.LOTGBN, B.SILGBN                                                                                                                              
           , B.CSTNAM, B.BUGAGB, B.CTBUGB, B.FILEGB, B.REMARK                                                                                                                               
        FROM ODDVER A
        LEFT JOIN MATMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'MATMST'
)
-- 활동센터 버전                                                                                                                                                                      
,BUSMST_VER AS (
      SELECT A.ODDGBN,B.VERNAM, B.BUSNAM, B.BUSSEQ, B.RSPBUS                                                                                                                              
           , B.BUSTYP, B.MNYGBN, B.REMARK, B.AREANM
        FROM ODDVER A
        LEFT JOIN BUSMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'BUSMST'
)
-- 매출 테이블
,MECHUL_TABLE_WITH AS (
     SELECT A.ODDGBN , SUM(A.KORAMT) AMOUNT , B.JEPGB1 , A.MAEMON
          , MAX(C.MATGB1) MATGB1 , MAX(D.AREANM) AREANM 
       FROM MAECUL A                                                                                                                                                              
       LEFT JOIN JEPMST_VER B ON A.JPCODE = B.JPCODE AND A.ODDGBN = B.ODDGBN                                                                                                                                                   
       LEFT JOIN MATMST_VER C ON A.JPCODE = C.MATCOD AND A.ODDGBN = C.ODDGBN                                                                                                                                                   
       LEFT JOIN BUSMST_VER D ON A.DEPTNM = D.BUSNAM AND A.ODDGBN = D.ODDGBN    
      WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
        AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
        AND D.AREANM IN ('칠서지점')
      GROUP BY A.MAEMON , A.ODDGBN , B.JEPGB1
)
-- 재료비 테이블
,RAWMAT_TABLE_WITH AS (
       SELECT  A.ODDGBN , MAX(A.RSTPLN) RSTPLN , A.MAEMON, MAX(A.DEPTNM) , MAX(A.JPCODE) JPCODE , SUM(A.AMOUNT) AMOUNT 	    			 					    
         FROM ( SELECT ODDGBN, RSTPLN, DATMON MAEMON, DEPTNM, JPCODE, AMOUNT                                                                                                         
                  FROM RAWMAT                                                                                                                                                        
                 UNION ALL                                                                                                                                                           
                SELECT ODDGBN, RSTPLN, DATMON, DEPTNM, JPCODE, AMOUNT                                                                                                                
                  FROM SUBMAT ) A                                                                                                                                                    
         LEFT JOIN BUSMST_VER B                                                                                                                                                      
           ON A.DEPTNM = B.BUSNAM                                                                                                                                                    
          AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
        WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
          AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	      AND B.AREANM IN ('칠서지점') 	
        GROUP BY A.MAEMON , A.ODDGBN
)
-- 고정비 테이블 (고정비+노무비+제조경비)                                                                                                             
 , FIX_NMB_JJB_TABLE_WITH AS(
      SELECT A.ODDGBN , A.DATMON MAEMON , MAX(A.BUSNAM) BUSNAM , A.ACDEXT , SUM(A.CHAAMT+A.DAEAMT) AMOUNT  
        FROM (SELECT A.ODDGBN , A.DATMON , A.BUSNAM , A.ACDEXT , A.CHAAMT , A.DAEAMT  		 
                FROM FIXAMT A                                                                    
                LEFT OUTER JOIN ODDCOD B                                                         
                  ON A.ODDGBN = B.ODDGBN                                                         
               WHERE B.RSTPLN = 'PLN'  -- 계획은 FIXAMT 테이블의 금액을 모두 사용.                                                           
               UNION ALL                                                                    	 
              SELECT C.ODDGBN , C.DATMON , C.BUSNAM , C.ACDEXT , C.CHAAMT , C.DAEAMT 			 
                FROM FIXAMT C                                                                    
                LEFT OUTER JOIN ODDCOD D                                                         
                  ON C.ODDGBN = D.ODDGBN                                                         
               WHERE D.RSTPLN = 'RST'  -- 실적은 FIXAMT 테이블 , 노무비 테이블 , 제조경비 테이블의 금액을 모두 사용한다.                                                           
                 AND C.ACDEXT NOT BETWEEN 5240000 AND 6099999                                    
               UNION ALL                                                                    	 
              SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT		 		 
                FROM NMBAMT                                                                 	 
               UNION ALL                                                                    	 
              SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT         	 
                FROM JJBAMT ) A
        LEFT JOIN BUSMST_VER B                                                                                                                                                      
          ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
         AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	     AND B.AREANM IN ('칠서지점')
       GROUP BY A.DATMON , A.ACDEXT , A.ODDGBN
)
-- 인건비 테이블 
, MANAMT_TABLE_WITH AS(
      SELECT A.ODDGBN , A.DATMON MAEMON, MAX(A.BUSNAM) BUSNAM , B.ACDEXT, SUM(A.CHAAMT + A.DAEAMT) AMOUNT                 										    	                                    
        FROM MANAMT A                                                                    										    	                                    
        LEFT JOIN ACDMST_VER B                                                           										    	                                    
          ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
         AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
         AND B.DISPGB = 'true'  
        LEFT JOIN BUSMST_VER C                                                                                                                                                      
          ON A.BUSNAM = C.BUSNAM                                                                                                                                                    
         AND A.ODDGBN = C.ODDGBN                                                                                                                                                    
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	     AND C.AREANM IN ('칠서지점')  
       GROUP BY A.DATMON , B.ACDEXT , A.ODDGBN
)
-- 운반비(MOVAMT) , 수출비(EXPAMT) , 폐용기(JNKAMT) , 폐기물(WSTAMT) 테이블
, MOV_EXP_JNK_WST_TABLE_WITH AS(
         SELECT A.ODDGBN , A.DATMON MAEMON, MAX(B.BUSNAM) BUSNAM , A.ACDEXT, SUM(A.CHAAMT+A.DAEAMT) AMOUNT
        FROM (    SELECT ODDGBN, DATMON, DEPTNM, '8260702' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM MOVAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8260702'	                                         											                                            
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8263502' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM EXPAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8263502'                                          											                                                
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8262906' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM JNKAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8262906'                                          											                                                
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8261703' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM WSTAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8261703'
             ) A      
        LEFT JOIN BUSMST_VER B                                                                                                                                                              
          ON A.DEPTNM = B.BUSNAM                                                                                                                                                            
         AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                                
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
         AND B.AREANM IN ('칠서지점')  
       GROUP BY A.DATMON , A.ACDEXT , A.ODDGBN
)

-- 제품
, ITEM_JEP_WITH AS(
           SELECT ODDGBN , AMOUNT , JEPGB1 , MAEMON                                                        
             FROM MECHUL_TABLE_WITH       
            WHERE JEPGB1 = '제품'
)
-- 상품
, ITEM_SANG_WITH AS(
      SELECT ODDGBN , AMOUNT , JEPGB1 , MAEMON                                                    
        FROM MECHUL_TABLE_WITH       
       WHERE JEPGB1 = '상품'
)
-- 매출 원가
, SALES_COST_WITH AS(
      SELECT ODDGBN , SUM(AMOUNT) AMOUNT , MAEMON  	    			 					    
        FROM RAWMAT_TABLE_WITH
       GROUP BY MAEMON , ODDGBN  
       UNION ALL                                                                                                                                                                    
      SELECT ODDGBN , SUM(AMOUNT) AMOUNT , MAEMON                                 
        FROM FIX_NMB_JJB_TABLE_WITH
       WHERE ACDEXT BETWEEN 5240000 AND 6099999
       GROUP BY MAEMON , ODDGBN
)
-- ▶매출총이익
, GROSS_MARGIN_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '매출' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM MECHUL_TABLE_WITH 
                 UNION ALL
                SELECT '매출' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM SALES_COST_WITH
             )
       GROUP BY VALGBN , MAEMON    
)
-- 일반 관리비 
, MAINTENANCE_COST_WITH AS(
      SELECT ODDGBN , AMOUNT , MAEMON 
        FROM ( SELECT ODDGBN , MAEMON , BUSNAM , ACDEXT , AMOUNT
                 FROM FIX_NMB_JJB_TABLE_WITH 
                UNION ALL
               SELECT ODDGBN, MAEMON , BUSNAM, ACDEXT, AMOUNT
                 FROM MANAMT_TABLE_WITH
                WHERE ACDEXT BETWEEN 5240000 AND 6099999  
                UNION ALL
               SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT
                 FROM MOV_EXP_JNK_WST_TABLE_WITH 
             )
       WHERE ACDEXT BETWEEN 8000000 AND 9999999   
)
-- ▶ 영 업 이 익
, BUSINESS_PROFITS_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '통합' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM GROSS_MARGIN_WITH 
                 UNION ALL
                SELECT '통합' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM MAINTENANCE_COST_WITH
             )
       GROUP BY VALGBN , MAEMON  
)
-- 4. 영 업 외 수 익  
, NON_OPERATING_INCOME_WITH AS(
  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                            
    FROM (  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                                                                                                                         
              FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                                 
             UNION ALL                                                                        										    	                                            
            SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                  										    	                                            
              FROM MANAMT_TABLE_WITH                                                                     										    	                                                           											                                                                                        
         )                        											                                                                                                                                                                                                                                                                 
   WHERE ACDEXT BETWEEN 6100000 AND 6199999  
)
-- 5. 영 업 외 비 용   
, NON_OPERATING_EXPENSES_WITH AS(
  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                            
    FROM (  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                                                                                                                         
              FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                                 
             UNION ALL                                                                        										    	                                            
            SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                  										    	                                            
              FROM MANAMT_TABLE_WITH                                                                     										    	                                                           											                                                                                        
         )                        											                                                                                                                                                                                                                                                                 
   WHERE ACDEXT BETWEEN 6200000 AND 7999999  
)
-- ▶ 경 상 이 익   
, ORDINARY_PROFIT_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '통합' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM BUSINESS_PROFITS_WITH 
                 UNION ALL
                SELECT '통합' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM NON_OPERATING_INCOME_WITH
                 UNION ALL
                SELECT '통합' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM NON_OPERATING_EXPENSES_WITH  
             )
       GROUP BY VALGBN , MAEMON  
)













-- 매출액
      SELECT '1. 매 출 액' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                               
        FROM MECHUL_TABLE_WITH  
       UNION ALL       
-- 제품 
      SELECT '　제품' VALGBN2 , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1 , SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ITEM_JEP_WITH
        GROUP BY JEPGB1
       UNION ALL
-- 상품
      SELECT '　상품' VALGBN2 , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1 , SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ITEM_SANG_WITH
       GROUP BY JEPGB1  
       UNION ALL      
-- 매출원가          
      SELECT '2. 매 출 원 가' VALGBN , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM SALES_COST_WITH 
       UNION ALL       
-- 재료비                                                                                                                                                                           
      SELECT '　재료비' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2  	    			 					        
        FROM RAWMAT_TABLE_WITH	
       UNION ALL  
-- 노무비
      SELECT '　노무비' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                    
        FROM FIX_NMB_JJB_TABLE_WITH                      											                                                                                    				                                                                                                                                                          
       WHERE ACDEXT BETWEEN 5240000 AND 5259999   
       UNION ALL    
-- 제조경비
      SELECT '　제조경비' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                  
        FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                        
       WHERE ACDEXT BETWEEN 5260000 AND 6099999                                                                                                                                             	
       UNION ALL
-- ▶매출총이익
      SELECT '▶ 매 출 총 이 익' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT
        FROM GROSS_MARGIN_WITH
       GROUP BY VALGBN
       UNION ALL    
-- 일반관리비
      SELECT '3. 일 반 관 리 비' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM MAINTENANCE_COST_WITH
       UNION ALL        
-- ▶영업이익
      SELECT '▶ 영 업 이 익' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM BUSINESS_PROFITS_WITH
       UNION ALL          
-- 4. 영 업 외 수 익
      SELECT '4. 영 업 외 수 익' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2       
        FROM NON_OPERATING_INCOME_WITH
       UNION ALL        
-- 5. 영 업 외 비 용  
      SELECT '5. 영 업 외 비 용' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2       
        FROM NON_OPERATING_EXPENSES_WITH
       UNION ALL        
-- ▶ 경상이익
      SELECT '▶ 경 상 이 익' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ORDINARY_PROFIT_WITH







        
        
        
        
        
                                                                                                                                                             
