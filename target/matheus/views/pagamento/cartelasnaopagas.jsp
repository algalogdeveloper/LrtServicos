
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <%@ include file="../../templete/aparencia.jsp"%>

    <body id="page-top">
        <%@ include file="../../templete/menu.jsp"%>
        <div id="wrapper">
            <%@ include file="../../templete/menu2.jsp"%>
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <nav
                        class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <%@ include file="../../templete/filtro.jsp"%>
                    </nav>
                    <div class="container-fluid">
                        <div
                            class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800 font-weight-bold">LISTA DE CARTELAS N�O
                                PAGAS</h1>
                            <a class="btn btn-info font-weight-bold"
                               href="controller?operacao=CarrinhoController&carrinho=loja">Criar
                                cartela</a>
                        </div>

                        <div class="card-group">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Filtrar pessoas pelo seu endere�os:</h5>
                                    <p class="card-text">
                                    <fieldset>
                                        <legend>Selecione a localiza��o:</legend>

                                        <form class="form-inline" action="controller">

                                            <div class="form-group mx-sm-3 mb-2">
                                                <input name="operacao" value="ExibirCartelasNaoPagas"
                                                       hidden=""> 

                                            </div>


                                            <div class="form-group mx-sm-3 mb-2">
                                                <label for="inputPassword2" class="sr-only">Filtrar</label> <select
                                                    name="filt" class="form-control font-weight-bold"
                                                    id="inputPassword2">

                                                    <c:forEach var="e" items="${locais}">
                                                        <option><c:out value="${e.descricao}"/> </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <button type="submit" class="btn btn-primary mb-2">
                                                <i class="fas fa-angle-double-right"></i> Buscar
                                            </button>
                                        </form>

                                    </fieldset>
                                    </p>


                                </div>
                            </div>
                            <div class="card">

                                <div class="card-body">
                                    <h5 class="card-title">Situa��o:</h5>
                                    <p class="card-text alert alert-info">A situa��o que a
                                        pessoa se encontra � referente aos pagamentos realizados na
                                        tela de pagamento.</p>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">Obs:</h5>
                                    <p class="card-text alert alert-danger">Todas cartelas
                                        n�o pagas pelo o endere�o selecionado est�o listadas abaixo.</p>

                                </div>
                            </div>
                        </div>
                        <hr>

                        <div class="row">
                            <!-- Area Chart -->
                            <div class="col-xl-12 col-lg-7">
                                <div class="card shadow mb-4 font-weight-bold">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <h6 class="m-0 font-weight-bold text-primary">Informo o limit de registro que voc� deseja vizualizar</h6>

                                    </div>
                                    <!-- Card Body -->
                                    <div class="card-body">


                                        <div class="row">
                                            <div class="col-xl-12 col-lg-4">

                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-hover"
                                                           id="dataTable">
                                                        <thead class="">
                                                            <tr class="">

                                                                <td>Pessoa</td>
                                                                <td>Situa��o</td>
                                                                <td>N�meros dos clientes</td>
                                                            </tr>
                                                        </thead>

                                                        <tfoot>
                                                            <tr class="">
                                                                <td>Pessoa</td>
                                                                <td>Situa��o</td>
                                                                <td>N�meros dos clientes</td>
                                                            </tr>
                                                        </tfoot>
                                                        <c:forEach var="c" items="${compras}">
                                                            <tr style="border-bottom-style: solid;">
                                                                <td><c:out value="${c.pessoa.nome}" /> - <f:formatNumber
                                                                        value="${c.valor}" type="currency" /></td>

                                                                <td><c:if test="${not c.pagou}">
                                                                        <i class="fas fa-check alert alert-danger"> <c:out
                                                                                value="Pagamento pendende" />
                                                                        </i>

                                                                    </c:if></td>
                                                                <td>
                                                                    <a href="controller?operacao=DetalhesAposta&acao=<c:out value="${c.idCompra}"/>" class="btn btn-outline-primary"><i class="fas fa-angle-double-right"></i> Detalhes da aposta</a>

                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                        <c:if test="${empty compras}">
                                                            <tr>
                                                                <td colspan="5">N�o existe compras</td>
                                                            </tr>
                                                        </c:if>

                                                    </table>
                                                </div>



                                            </div>
                                            <br> <br>
                                        </div>

                                    </div>



                                </div>

                            </div>

                        </div>
                    </div>

                </div>
                <%@include file="../../templete/scripts.jsp"%>
                <script src="javascript/habilitar.js" type="text/javascript"></script>
                </body>

                </html>
