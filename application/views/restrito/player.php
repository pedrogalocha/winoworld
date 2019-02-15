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
            <li class="list-group-item text-muted">Info <i class="fa fa-dashboard fa-1x"></i></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Vida Atual</strong></span><?php print_r($playerInfo['hp']); ?></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Zumbis Mortos</strong></span> <?php print_r($zumbis); ?></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong>Missões Concluidas</strong></span> <?php print_r($missoes_concluidas); ?></li>
            <li class="list-group-item text-right" title="Tempo Médio de Missão"><span class="pull-left"><strong>TMM</strong></span> 15:34:35</li>
          </ul> 
    </div><!--/col-3-->
    <div class="col-sm-9">
      <br>
      <h1 class="h1-player">Conquistas</h1>
        <div class="row" style="margin-left: 10%;">
        <?php foreach ($conquistas as $acc){ ?>   
          <div class="card mb-3 ml-3 " style="max-width: 190px;">
            <div class="row no-gutters">
              <div class="col-md-12">
                <img src="<?php echo base_url('includes/img/'.$acc->imagem) ?>" class="card-img" alt="..." style="max-width: 188px;">
              </div>
              <div class="col-md-12">
                <div class="card-body">
                  <h5 class="card-title"><?php print_r($acc->nome_con); ?></h5>
                  <p class="card-text"><?php print_r($acc->descricao); ?></p>
                  <p class="card-text"><small class="text-muted"><?php print_r($acc->data); ?></small></p>
                </div>
              </div>
            </div>
          </div>
        <?php }?>
        <?php $this->load->view('restrito/player/listar_tarefas')?>
      </div>
      </div>
      </div><!--/row-->
      </div><!--/card-avatar-->
</div>
<?php $this->load->view('restrito/player/add_tarefas')?>

<?php $this->load->view('footer')?>
    