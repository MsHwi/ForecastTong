
public class makeData {
	int x = 0;
	int y = 0;
	ActionCommand actionCommand = new ActionCommand();
	LocalDAO localDAO = new LocalDAO();
	GribDAO gribDAO = new GribDAO();
	String firststage = request.getParameter("firststage");
	String secondstage = request.getParameter("secondstage");
	String thirdstage = request.getParameter("thirdstage");

	System.out.println("실시간 및 단기예보 보기 파라미터 확인: 1단계주소>" + firststage + "2단계주소>" + secondstage + "3단계주소>" + thirdstage);

	String areano = localDAO.bring123(firststage, secondstage, thirdstage);
	LocalDTO localDTO = localDAO.bringAreano(firststage, secondstage, thirdstage);
	x = localDTO.getA_X();
	y = localDTO.getA_Y();
	
	MakeRTURL makeRTURL = new MakeRTURL();
	MakeGribURL makeGribURL = new MakeGribURL();
	String rturl = makeRTURL.makeRTURL(x, y);
	String griburl = makeGribURL.makeGribURL(x, y);

	GribDTO gribDTO = gribDAO.jsonparser(rturl, griburl);
	
	System.out.println("--------------------- 실시간 및 단기예보 gribDTO 가공 완료");
	
	request.setAttribute("gribDTO", gribDTO);
	
	actionCommand.setPath("./forecast/gribfsctajax.jsp");
	actionCommand.setRedirect(false);
	return actionCommand;
}
}
