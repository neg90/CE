<?php

/* basePrivada.html.twig */
class __TwigTemplate_30bd825d2898a100c95ba56fe006e6702660665e83e8c479b4a0ba78a2bb9521 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
            'head' => array($this, 'block_head'),
            'title' => array($this, 'block_title'),
            'contenedor' => array($this, 'block_contenedor'),
            'footer' => array($this, 'block_footer'),
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html>

    <head>
        ";
        // line 5
        $this->displayBlock('head', $context, $blocks);
        // line 15
        echo "    </head>
    <body>
        <header>
            <div class=\"header-izq\">
                <div id=\"logo\">
                  <a href=\"privado.php\" target:\"_self\"><img src=\"../img/CElogo.png\"></a>
                </div>
            </div>

            <div class=\"header-der\">
                <div id=\"bienvenido\">
                    <span class=\"glyphicon glyphicon-user\" aria-hidden=\"true\"></span>Bienvenido <b>";
        // line 26
        echo twig_escape_filter($this->env, (isset($context["user"]) ? $context["user"] : null), "html", null, true);
        echo "</b>
                </div>
            </div>
        </header>
        <div class=\"clearfix\"></div>
        <!-- Empieza la barra -->
        <nav class=\"navbar navbar-default barra-Principal\">
          <div class=\"container-fluid\">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class=\"navbar-header\">
              <button type=\"button\" class=\"navbar-toggle collapsed\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">
              </button>
              <a class=\"navbar-brand\" href=\"#\">
                <span class=\"glyphicon glyphicon-home\" aria-hidden=\"true\"></span>
                  <span id=\"inicio\">Inicio</span>
              </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class=\"collapse navbar-collapse\" id=\"bs-example-navbar-collapse-1\">
              <ul class=\"nav navbar-nav\">
                <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Usuario<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>Listar usuarios
                      </a>
                    </li>
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>Nuevo usuario
                      </a>
                    </li>
                  </ul>
                </li>
                <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Rol<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>Listar roles
                      </a>
                    </li>
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>Nuevo rol
                      </a>
                    </li>
                  </ul>
                </li>
                <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Contacto<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"privado.php?c=contacto&a=listar\">
                        <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>Listar contacto
                      </a>
                    </li>
                    <li>
                      <a href=\"privado.php?c=contacto&a=alta\">
                        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>Nuevo contacto
                      </a>
                    </li>
                  </ul>
                </li>
                <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Titulares de Medidor<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>Listar titulares
                      </a>
                    </li>
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>Nuevo titular
                      </a>
                    </li>
                  </ul>
                </li>
                 <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Empresas<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>Listar empresa
                      </a>
                    </li>
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-plus\" aria-hidden=\"true\"></span>Nueva Empresa
                      </a>
                    </li>
                  </ul>
                </li>
              </ul>
              <ul class=\"nav navbar-nav navbar-right\">
               <li class=\"dropdown\">
                  <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\" role=\"button\" aria-expanded=\"false\">Mi Perfil<span class=\"caret\"></span></a>
                  <ul class=\"dropdown-menu\" role=\"menu\">
                    <li>
                      <a href=\"#\">
                        <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>Modificar mis datos
                      </a>
                    </li>
                    <li>
                      <a href=\"logout.php\">
                        <span class=\"glyphicon glyphicon-arrow-left\" aria-hidden=\"true\"></span>Cerrar Sesion
                      </a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div><!-- /.navbar-collapse -->
          </div><!-- /.container-fluid -->
        </nav>
        <!-- /.navbar -->
        <div id=\"contenedor\">";
        // line 143
        $this->displayBlock('contenedor', $context, $blocks);
        echo "</div>
        <div class=\"footer\">
            ";
        // line 145
        $this->displayBlock('footer', $context, $blocks);
        // line 148
        echo "        </div>
    </body>
</html>
";
    }

    // line 5
    public function block_head($context, array $blocks = array())
    {
        // line 6
        echo "            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />
    \t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    \t\t<link rel=\"shortcut icon\" href=\"favicon.ico\" />
    \t\t<link href=\"../css/bootstrap.css\" rel=\"stylesheet\" media=\"screen\">
    \t\t<link href=\"../css/admin.css\" rel=\"stylesheet\" media=\"screen\">
            <script src=\"http://code.jquery.com/jquery.js\"></script>
            <script src=\"../js/bootstrap.min.js\"></script>
            <title>";
        // line 13
        $this->displayBlock('title', $context, $blocks);
        echo " - Sistema de gestión Cámara Económica Tres Arroyos</title>
        ";
    }

    public function block_title($context, array $blocks = array())
    {
    }

    // line 143
    public function block_contenedor($context, array $blocks = array())
    {
    }

    // line 145
    public function block_footer($context, array $blocks = array())
    {
        // line 146
        echo "                <div class=\"panel-footer pie\">Sistema de gestión Cámara Económica Tres Arroyos</div>
            ";
    }

    public function getTemplateName()
    {
        return "basePrivada.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  208 => 146,  205 => 145,  200 => 143,  190 => 13,  181 => 6,  178 => 5,  171 => 148,  169 => 145,  164 => 143,  44 => 26,  31 => 15,  29 => 5,  23 => 1,);
    }
}
