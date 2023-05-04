<?php
namespace Drupal\major_flows\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\node\Entity\Node;

class UpdateContentController extends ControllerBase {

  /**
   * Displays the landing page.
   *
   * @return array
   *   The render array representing the landing page.
   */
  public function landingPage($nid) {
    $node = Node::load($nid);
    $form = \Drupal::service('entity.form_builder')->getForm($node);
    unset($form['field_images']);
    return $form;
  }

}