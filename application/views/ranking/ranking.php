<?php $this->load->view('header')?>
<div class="col-sm-12">
  <h1 class="text-ranking">TABELA CAMPEONATO</h1>
  <div class="hero-center">
  <img src="<?php echo base_url('includes/img/hero.png')?>" alt="" />
  </div>
  <div class="col-sm-12">
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col">Heroi</th>
          <th scope="col">HP</th>
          <th scope="col">Level</th>
          <th scope="col">Classe</th>
          <th scope="col">XP</th>
          <th scope="col">TMA</th>
          <th scope="col">Zumbis Mortos</th>
          <th scope="col">Mortes</th>
        </tr>
      </thead>

      <tbody>
        <?php foreach ($ranking as $ran){ ?>  
          <tr>
            <td><?= $ran->name; ?></td>
            <td><?= $ran->hp; ?></td>
            <td><?= $ran->level; ?></td>
            <td><?= $ran->class_name; ?></td>
            <td><?= $ran->xp; ?></td>
            <td><?= $ran->tma; ?></td>
            <td><?= $ran->zumbis_mortos; ?></td>
            <td><?= $ran->chance; ?></td>
          </td>
          </tr>
        <?php }?>
      </tbody>
    </table>
  </div>
</div>
<?php $this->load->view('footer')?>