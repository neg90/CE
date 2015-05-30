<?php

/* listarContacto.html.twig */
class __TwigTemplate_68ff784d4500750bbef3c45ae00b7bb2c52aaec83b0ed42741b9259f560dd602 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        // line 1
        $this->parent = $this->loadTemplate("basePrivada.html.twig", "listarContacto.html.twig", 1);
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
        // line 5
        echo "   
 <div class=\"container\" style=\"padding-top: 1em;\">
  <table class=\"table table-hover\">
  <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Username</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
  </tbody>
  </table>
</div>
         
";
    }

    public function getTemplateName()
    {
        return "listarContacto.html.twig";
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
