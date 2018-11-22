<?php
/**
 * Created by PhpStorm.
 * User: dibyajyoti
 * Date: 21/11/18
 * Time: 7:10 AM
 */

namespace Drush\Commands;


class SiteInstallCommands extends DrushCommands
{

    /**
     * Modify files/directory permission as per project's need executing just after `drush site:install`
     *
     * @hook post-command site-install
     *
     */
    public function installChmod() {
        drush_shell_exec('chmod -R 740 sites/default');
//        $this->logger()->success(dt('Executing post install command'));
    }
}