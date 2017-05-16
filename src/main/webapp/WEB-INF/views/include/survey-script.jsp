<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- banner end -->

<!-- JavaScript files placed at the end of the document so the pages load faster
		================================================== -->
<!-- Jquery and Bootstap core js files -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/jquery.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

<!-- Modernizr javascript -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/modernizr.js"></script>

<!-- Isotope javascript -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/isotope/isotope.pkgd.min.js"></script>

<!-- Backstretch javascript -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/jquery.backstretch.min.js"></script>

<!-- Appear javascript -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/plugins/jquery.appear.js"></script>

<!-- Initialization of Plugins -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/survey-animation.js"></script>

<!-- Custom Scripts -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/custom.js"></script>

<!-- facebook  -->
<script
	src="${pageContext.request.contextPath }/assets/js/facebook_auth.js"></script>
	
<script>

$( function() {
    $( "input" ).checkboxradio({
      icon: false
    });
  } );

</script>
</body>
</html>