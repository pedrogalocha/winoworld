<?php $this->load->view('header')?>

<div class="container bootstrap snippet card-avatar">
    <div class="row">
  		<div class="col-sm-3"><h1><?php print_r($playerInfo['name']); ?></h1></div>
      <div class="col-sm-3"><h1>Classe: <?php print_r($playerInfo['class_name']); ?></div>
      <div class="col-sm-3"><h1>Level: <?php print_r($playerInfo['level']); ?></div>
      <div class="col-sm-3"><h1>XP Atual: <?php print_r($playerInfo['xp']); ?></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
      <div class="text-center">
        <img src="<?php echo base_url('includes/img/'.$playerInfo['avatar']) ?>" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block file-upload">
      </div></hr><br>

          <ul class="list-group">
            <li class="list-group-item text-muted">Atividade <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Vida Atual</strong></span><?php print_r($playerInfo['hp']); ?></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Zumbis Mortos</strong></span> 13</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Missões Concluidas</strong></span> 37</li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Patente</strong></span> Soldado</li>
          </ul> 
          
    </div><!--/col-3-->
    <div class="col-sm-9">
      <br>
      <h1 class="h1-player">Conquistas</h1>
      <?php while ($conquistas = mysql_fetch_assoc($conquistas) ) { ?>
    	<div class="col-sm-3">       
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                    <div class="form-group">
                        <div class="col-xs-6">
                        <div class="card" style="width: 18rem;">
                          <div class="card-body">
                            <h5 class="card-title"><?php print_r($conquistas['nome_con']); ?></h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>
                          </div>
                        </div>
                        </div>
                  </div>    
                <hr>
          </div><!--/tab-pane-->
          </div><!--/tab-content-->
     <?php }?>
        </div><!--/col-6-->
      </div>
      </div>
      </div><!--/row-->
      </div><!--/card-avatar-->
</div>
<?php $this->load->view('footer')?>
    