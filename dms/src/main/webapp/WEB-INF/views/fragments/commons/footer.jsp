<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


    <!-- jQuery 2.1.4 -->
    <script src='<spring:url value="/resources/template/plugins/jQuery/jQuery-2.1.4.min.js"></spring:url>'></script>
    <!-- Bootstrap 3.3.5 -->
     <script src='<spring:url value="/resources/template/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
     
      <script src='<spring:url value="/resources/template/plugins/select2/select2.full.min.js"></spring:url>'></script>
     <script src='<spring:url value="/resources/template/plugins/jQueryUI/jquery-ui.min.js"></spring:url>'></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
     <script src='<spring:url value="/resources/template/plugins/daterangepicker/daterangepicker.js"></spring:url>'></script>
      <script src='<spring:url value="/resources/template/plugins/datepicker/bootstrap-datepicker.js"></spring:url>'></script>
    <!-- SlimScroll -->
    <script src='<spring:url value="/resources/template/plugins/slimScroll/jquery.slimscroll.min.js"></spring:url>'></script>
    <script src='<spring:url value="/resources/template/plugins/fastclick/fastclick.min.js"></spring:url>'></script>
    <!-- AdminLTE App -->
      <script src='<spring:url value="/resources/template/dist/js/app.min.js"></spring:url>'></script>
    <!-- AdminLTE for demo purposes -->
     <script src='<spring:url value="/resources/template/dist/js/demo.js"></spring:url>'></script>
    
     <script>
      $(function () {
        //Initialize Select2 Elements
        $(".select2").select2();
      });
    </script>
  </body>
</html>