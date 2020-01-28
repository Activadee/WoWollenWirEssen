<?php


namespace model;


class Filter
{
    private $kat;
    private $entf;
    private $preis;
    private $veggie;
    private $dbConnect;

    /**
     * Filter constructor.
     * @param $kat
     * @param $entf
     * @param $preis
     * @param $veggie
     */
    public function __construct($kat, $entf, $preis, $veggie)
    {
        $this->kat = $kat;
        $this->entf = $entf;
        $this->preis = $preis;
        $this->veggie = $veggie;
        $this->dbConnect = \dbConn::getInstance();
    }

    /**
     * @return mixed
     */
    public function getKat()
    {
        return $this->kat;
    }

    /**
     * @param mixed $kat
     */
    public function setKat($kat)
    {
        $this->kat = $kat;
    }

    /**
     * @return mixed
     */
    public function getEntf()
    {
        return $this->entf;
    }

    /**
     * @param mixed $entf
     */
    public function setEntf($entf)
    {
        $this->entf = $entf;
    }

    /**
     * @return mixed
     */
    public function getPreis()
    {
        return $this->preis;
    }

    /**
     * @param mixed $preis
     */
    public function setPreis($preis)
    {
        $this->preis = $preis;
    }

    /**
     * @return mixed
     */
    public function getVeggie()
    {
        return $this->veggie;
    }

    /**
     * @param mixed $veggie
     */
    public function setVeggie($veggie)
    {
        $this->veggie = $veggie;
    }

    public function getRestaurants(Filter $filter)
    {
        $varKat = "=";
        $varEnt = "=";
        $varPreis = "=";
        $varVeg = "=";
        if ($filter->getKat() == 1) {
            $varKat = ">=";
        }
        if ($filter->getEntf() == 3 || $filter->getEntf() == 2) {
            $varEnt = "<=";
        }
        if ($filter->getPreis() == 3 ||$filter->getPreis() == 2 ) {
            $varPreis = "<=";
        }
        if ($filter->getVeggie() == 1) {
            $varVeg = ">=";
        }
        $preStmt = $this->dbConnect->prepare("SELECT * FROM restaurants WHERE kategorie " . $varKat . " ?  AND entfernung 
                                                " . $varEnt . " ? AND preis " . $varPreis . " ? AND veggie " . $varVeg . "?");
        $kat = $filter->getKat();
        $entf = $filter->getEntf();
        $preis = $filter->getPreis();
        $veg = $filter->getVeggie();

        $preStmt->bind_param("iiii", $kat, $entf, $preis, $veg);
        $preStmt->execute();
        $preStmt->bind_result($id, $name, $entf, $preis, $veg, $adresse, $kat);
        while ($preStmt->fetch()) {
            $str = "";
            $dist = "";
            $veggie = "";
            for ($i = 0; $i < $preis; $i++) {
                $str .= "* ";
            }
            for ($i = 0; $i < $entf; $i++) {
                $dist .= "* ";
            }
            for ($i = 0; $i < $veg; $i++) {
                $veggie .= "* ";
            }
            echo('<span>' . $name . '</span> | <i class="fa fa-money"></i> ' . ' ' . $str . ' | <i class="fa fa-car"></i>' . ' ' . $dist . '  | <i class="fa fa-tree"></i>' . ' ' . $veggie . '  <br>'


            );

        }


    }
}
