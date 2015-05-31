<?php

/* contacto/altaContacto.html.twig */
class __TwigTemplate_e8ec04a77e24f6661238a8a3b1f9e842a736248d698e7bb50ba458cc76288f6b extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        // line 1
        $this->parent = $this->loadTemplate("basePrivada.html.twig", "contacto/altaContacto.html.twig", 1);
        $this->blocks = array(
            'title' => array($this, 'block_title'),
            'contenedor' => array($this, 'block_contenedor'),
        );
    }

    protected function doGetParent(array $context)
    {
        return "basePrivada.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        $this->parent->display($context, array_merge($this->blocks, $blocks));
    }

    // line 3
    public function block_title($context, array $blocks = array())
    {
        echo " Crear Nuevo Contacto ";
    }

    // line 4
    public function block_contenedor($context, array $blocks = array())
    {
        // line 5
        echo "\t<form class=\"form-horizontal\" role=\"form\">
\t\t<div class=\"contenedor-formulario\">
\t\t\t <div class=\"row\">
\t\t\t \t<div class=\"col-lg-6\"> 
\t\t\t \t\t<div class=\"form-group\">
\t\t\t\t\t\t<label class=\"col-lg-2 control-label\">Nombre: </label>
\t\t\t\t\t\t<div class=\"col-lg-6 \"> 
\t\t\t\t\t\t  <input type=\"text\" class=\"form-control\">
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t\t<div class=\"col-lg-6\"> 
\t\t\t \t\t<div class=\"form-group\">
\t\t\t\t\t\t<label class=\"col-lg-2 control-label\">Apellido: </label>
\t\t\t\t\t\t<div class=\"col-lg-6 \"> 
\t\t\t\t\t\t  <input type=\"text\" class=\"form-control\">
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t  </div>
\t\t\t   <div class=\"row\">
\t\t\t \t<div class=\"col-lg-6\"> 
\t\t\t \t\t<div class=\"form-group\">
\t\t\t\t\t\t<label class=\"col-lg-2 control-label\">Telefono: </label>
\t\t\t\t\t\t<div class=\"col-lg-6 \"> 
\t\t\t\t\t\t  <input type=\"text\" class=\"form-control\">
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t\t<div class=\"col-lg-6\"> 
\t\t\t \t\t<div class=\"form-group\">
\t\t\t\t\t\t<label class=\"col-lg-2 control-label\">Domicilio: </label>
\t\t\t\t\t\t<div class=\"col-lg-6 \"> 
\t\t\t\t\t\t  <input type=\"text\" class=\"form-control\">
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t </div>
\t\t\t <div class=\"row\">
\t\t\t \t<div class=\"col-lg-6\"> 
\t\t\t \t\t<div class=\"form-group\">
\t\t\t\t\t\t<label class=\"col-lg-2 control-label\">Correo: </label>
\t\t\t\t\t\t<div class=\"col-lg-6 \"> 
\t\t\t\t\t\t  <input type=\"text\" class=\"form-control\">
\t\t\t\t\t\t</div>
\t\t\t\t\t</div>
\t\t\t\t</div>
\t\t\t </div>
\t\t\t  <div class=\"row\">
\t\t\t \t<div class=\" col-lg-6\">
\t\t\t\t\t<input class=\"col-lg-2\" type=\"checkbox\"> 
\t\t\t\t\t<label class=\"col-lg-8\">¿Asociado a SW? </label>
\t\t\t    </div>
\t\t\t\t<div class=\" col-lg-6\">
\t\t\t\t\t<input class=\"col-lg-2\" type=\"checkbox\"> 
\t\t\t\t\t<label class=\"col-lg-8\">¿Activo? </label>
\t\t\t\t</div>
\t\t\t </div>
\t\t\t <div class=\"row fila-de-boton\">
\t\t\t \t<div class=\" col-lg-4\"></div>
\t\t\t \t<div class=\" col-lg-4\">
\t\t\t\t<button type=\"submit\" class=\"btn btn-default btn-lg btn-block col-lg-4\">Enviar</button>
\t\t\t\t</div>
\t\t\t\t<div class=\" col-lg-4\"></div>
\t\t\t</div>
\t\t</div>
\t</form>
";
    }

    public function getTemplateName()
    {
        return "contacto/altaContacto.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  38 => 5,  35 => 4,  29 => 3,  11 => 1,);
    }
}
