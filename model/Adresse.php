<?php


namespace model;


class Adresse
{
private $str;
private $hsnr;
private $plz;
private $ort;

    /**
     * Adresse constructor.
     * @param $str
     * @param $hsnr
     * @param $plz
     * @param $ort
     */
    public function __construct($str, $hsnr, $plz, $ort)
    {
        $this->str = $str;
        $this->hsnr = $hsnr;
        $this->plz = $plz;
        $this->ort = $ort;
    }


    /**
     * @return mixed
     */
    public function getStr()
    {
        return $this->str;
    }

    /**
     * @param mixed $str
     */
    public function setStr($str)
    {
        $this->str = $str;
    }

    /**
     * @return mixed
     */
    public function getHsnr()
    {
        return $this->hsnr;
    }

    /**
     * @param mixed $hsnr
     */
    public function setHsnr($hsnr)
    {
        $this->hsnr = $hsnr;
    }

    /**
     * @return mixed
     */
    public function getPlz()
    {
        return $this->plz;
    }

    /**
     * @param mixed $plz
     */
    public function setPlz($plz)
    {
        $this->plz = $plz;
    }

    /**
     * @return mixed
     */
    public function getOrt()
    {
        return $this->ort;
    }

    /**
     * @param mixed $ort
     */
    public function setOrt($ort)
    {
        $this->ort = $ort;
    }
}