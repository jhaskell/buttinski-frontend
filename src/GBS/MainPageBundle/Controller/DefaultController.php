<?php

namespace GBS\MainPageBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction($name)
    {
        return $this->render('GBSMainPageBundle:Default:index.html.twig', array('name' => $name));
    }
}
