<?php

/* contacto/listarContacto.html.twig */
class __TwigTemplate_68ff784d4500750bbef3c45ae00b7bb2c52aaec83b0ed42741b9259f560dd602 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        // line 1
        $this->parent = $this->loadTemplate("basePrivada.html.twig", "contacto/listarContacto.html.twig", 1);
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
        echo " Lista de Contactos ";
    }

    // line 4
    public function block_contenedor($context, array $blocks = array())
    {
        echo "   
  <table class=\"table table-hover\">
  <thead>
    <tr>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Telefono</th>
      <th>Correo</th>
      <th>Asocioado a SM</th>
      <th>Inicio en CE</th>
      <th>Activo</th>
      <th>Controles</th>
    </tr>
  </thead>
  <tbody>
    ";
        // line 19
        $context['_parent'] = (array) $context;
        $context['_seq'] = twig_ensure_traversable((isset($context["contactos"]) ? $context["contactos"] : null));
        foreach ($context['_seq'] as $context["_key"] => $context["item"]) {
            // line 20
            echo "      <tr>
        <td>
          ";
            // line 23
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "nombre", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 25
            echo "        </td>
        <td>
          ";
            // line 28
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "apellido", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 30
            echo "        </td>
        <td>
          ";
            // line 33
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "telefono", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 35
            echo "        </td>
        <td>
          ";
            // line 38
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "correo", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 40
            echo "        </td>
        <td class=\"celda-numero\">
          ";
            // line 43
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "asociadosm", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 45
            echo "        </td>
        <td>
          ";
            // line 48
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "fechainicioce", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 50
            echo "        </td>
        <td class=\"celda-numero\">
          ";
            // line 53
            echo "            ";
            echo twig_escape_filter($this->env, twig_convert_encoding($this->getAttribute($context["item"], "activo", array()), "UTF-8", "iso-2022-jp"), "html", null, true);
            echo "    
          ";
            // line 55
            echo "        </td>
        <td>
          <span class=\"glyphicon glyphicon-eye-open\" aria-hidden=\"true\"></span>
          <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span>
          <span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span>
        </td>
        
      </tr>
    ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['item'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 64
        echo "  </tbody>
  </table>

";
    }

    public function getTemplateName()
    {
        return "contacto/listarContacto.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  135 => 64,  121 => 55,  116 => 53,  112 => 50,  107 => 48,  103 => 45,  98 => 43,  94 => 40,  89 => 38,  85 => 35,  80 => 33,  76 => 30,  71 => 28,  67 => 25,  62 => 23,  58 => 20,  54 => 19,  35 => 4,  29 => 3,  11 => 1,);
    }
}
