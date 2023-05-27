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
    $form['field_images']['#access'] = FALSE;
    $form['field_issue_type']['#access'] = FALSE;
    $form['field_location']['#access'] = FALSE;
    $form['body']['#access'] = FALSE;
    $form['title']['widget'][0]['value']['#attributes'] = [
      'disabled' => TRUE
    ];
    return $form;
  }

}