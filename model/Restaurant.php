<?php


namespace model;


class Restaurant
{
private $name;
private $entf;
private $preis;
private $veggie;
private Adresse $adresse;
private $kategorie;

    /**
     * Restaurant constructor.
     * @param $name
     * @param $entf
     * @param $preis
     * @param $veggie
     * @param Adresse $adresse
     * @param $kategorie
     */
    public function __construct($name, $entf, $preis, $veggie, Adresse $adresse, $kategorie)
    {
        $this->name = $name;
        $this->entf = $entf;
        $this->preis = $preis;
        $this->veggie = $veggie;
        $this->adresse = $adresse;
        $this->kategorie = $kategorie;
    }

    /**
     * @return mixed
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param mixed $name
     */
    public function setName($name)
    {
        $this->name = $name;
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

    /**
     * @return Adresse
     */
    public function getAdresse()
    {
        return $this->adresse;
    }

    /**
     * @param Adresse $adresse
     */
    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    }

    /**
     * @return mixed
     */
    public function getKategorie()
    {
        return $this->kategorie;
    }

    /**
     * @param mixed $kategorie
     */
    public function setKategorie($kategorie)
    {
        $this->kategorie = $kategorie;
    }
}