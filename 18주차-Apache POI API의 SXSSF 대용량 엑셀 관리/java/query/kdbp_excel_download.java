package query;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
public class kdbp_excel_download {
	public void jsonToExcel(String filePath, String file_name, JSONObject jBean) throws Exception 
	{
		try {
 			JSONArray excelArray = jBean.getJSONArray("rows"); //그리드 바디
 			JSONArray head_excelArray = jBean.getJSONArray("head_rows"); //그리드 헤드
 			int headcnt = head_excelArray.size();
 			int rowcnt = excelArray.size();
			SXSSFWorkbook wb = new SXSSFWorkbook(100); // keep 100 rows in memory, exceeding rows will be flushed to disk
			
			//컬럼 헤더 스타일
			XSSFCellStyle cellHeadStyle = (XSSFCellStyle) wb.createCellStyle();
			cellHeadStyle.setFillForegroundColor(new XSSFColor(new java.awt.Color(248,248,248)));          
			cellHeadStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
			cellHeadStyle.setBorderTop(CellStyle.BORDER_THIN);
			cellHeadStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
			cellHeadStyle.setBorderBottom(CellStyle.BORDER_THIN);
			cellHeadStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
			cellHeadStyle.setBorderLeft(CellStyle.BORDER_THIN);
			cellHeadStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
			cellHeadStyle.setBorderRight(CellStyle.BORDER_THIN);
			cellHeadStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
			cellHeadStyle.setAlignment(CellStyle.ALIGN_CENTER);
			cellHeadStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
			
			//바디 스타일 저장용 해쉬맵
			Map<String, XSSFCellStyle> cellStyles = new HashMap<String, XSSFCellStyle>();
			
			Sheet sh = wb.createSheet();
			
			for(int rownum = 0; rownum < rowcnt+headcnt; rownum++){
				Row row = sh.createRow(rownum);
				int cellnum = 0;
				
				if(rownum == headcnt && headcnt > 1) {//헤더를 다 그린 후 셀 병합 처리.
					for(int i=0; i<headcnt-1; i++) {
						JSONObject row_data = head_excelArray.getJSONObject(i);
						if(row_data.size()==3) break; //헤더 로우의 사이즈가 3보다 작으면 그룹 로우가 아니므로 반복문 종료.
						Iterator<String> grid_keys = row_data.keys();
						int head_cellnum = 0;
						while(grid_keys.hasNext()) {
							String key = grid_keys.next();
							int len = row_data.getJSONObject(key).getInt("LENGTH");
							if(len == 0 ) {
								sh.addMergedRegion(new CellRangeAddress(0,headcnt-1,head_cellnum,head_cellnum));
							}else if(len == 1 ) { // 1그룹에 1개 컬럼인 경우 컬럼을 머지할 필요가 없음.
							}else {
								sh.addMergedRegion(new CellRangeAddress(0,0,head_cellnum,head_cellnum+len-1));
								for(int j=1; j<len; j++){grid_keys.next(); head_cellnum++;}
							}
							head_cellnum++;
						}
					}
				}
				
				if(rownum < headcnt) {//헤더 처리
					JSONObject row_data = head_excelArray.getJSONObject(rownum);
					Iterator<String> grid_keys = row_data.keys();
					while(grid_keys.hasNext()) {
						String key = grid_keys.next();
						Cell cell = row.createCell(cellnum);
						cell.setCellValue(row_data.getJSONObject(key).getString("TEXT"));
						sh.setColumnWidth(cellnum, row_data.getJSONObject(key).getInt("WIDTH")*35); //엑셀상 적절한 width를 위해 조정
						cell.setCellStyle(cellHeadStyle);
						cellnum++;
					}
				}else {//바디 처리
					
					JSONObject row_data = excelArray.getJSONObject(rownum-headcnt);
					Iterator<String> grid_keys = head_excelArray.getJSONObject(0).keys();
					while(grid_keys.hasNext()) {
						String key = grid_keys.next();
						String cell_value = "";
						
						//포맷 체크를 위한 선언
						String head_format = head_excelArray.getJSONObject(0).getJSONObject(key).getString("FORMAT");
						
						/* row의 값이 undefined로 넘어왔을 경우 키를 소실함. 
						   컬럼 헤더와 로우의 키값이 상이한 경우의 예외처리.
						*/
						try {
							cell_value = row_data.getString(key);
						} catch (Exception e) {
							cell_value = "";
						}
						Cell cell = row.createCell(cellnum);
						if(!head_format.equals("")) {//편의상 포맷이 있으면 넘버값인 것으로.
							cell.setCellValue(Double.parseDouble(cell_value));
						}else {
							cell.setCellValue(cell_value);
						}
						if(rownum-headcnt == 0) {
							//첫 컬럼 바디 스타일
							XSSFCellStyle cellBodyStyle = (XSSFCellStyle) wb.createCellStyle();
							cellBodyStyle.setBorderTop(CellStyle.BORDER_THIN);
							cellBodyStyle.setTopBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
							cellBodyStyle.setBorderBottom(CellStyle.BORDER_THIN);
							cellBodyStyle.setBottomBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
							cellBodyStyle.setBorderLeft(CellStyle.BORDER_THIN);
							cellBodyStyle.setLeftBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
							cellBodyStyle.setBorderRight(CellStyle.BORDER_THIN);
							cellBodyStyle.setRightBorderColor(new XSSFColor(new java.awt.Color(221,221,221))); 
							cellBodyStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
							
							//정렬
							String head_align = head_excelArray.getJSONObject(0).getJSONObject(key).getString("ALIGN");
							if(head_align.equals("center")) {
								cellBodyStyle.setAlignment(CellStyle.ALIGN_CENTER);
							}else if(head_align.equals("left")) {
								cellBodyStyle.setAlignment(CellStyle.ALIGN_LEFT);
							}else if(head_align.equals("right")) {
								cellBodyStyle.setAlignment(CellStyle.ALIGN_RIGHT);
							}
							//포맷
							if(!head_format.equals("")) {//편의상 포맷이 있으면 넘버값인 것으로.
								XSSFDataFormat format = (XSSFDataFormat)wb.createDataFormat();
								cellBodyStyle.setDataFormat(format.getFormat("#,###0.##0"));
							}
							cellStyles.put(key, cellBodyStyle);
						}
						cell.setCellStyle(cellStyles.get(key));
						cellnum++;
					}
				}
				
//				//수동 플러쉬
//				if(rownum % 100 == 0) {
//		               ((SXSSFSheet)sh).flushRows(100); // retain 100 last rows and flush all others
//		               // ((SXSSFSheet)sh).flushRows() is a shortcut for ((SXSSFSheet)sh).flushRows(0),
//		               // this method flushes all rows
//		        }
			}
			
			FileOutputStream out = new FileOutputStream(filePath+file_name);
			wb.write(out);
			out.close();
			// dispose of temporary files backing this workbook on disk
			wb.dispose();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
	}
}
