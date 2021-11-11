package com.figueiras.photocontest.backend.rest.dtos;

import java.util.List;

public class AsistenciaCompletaDto {
    private Long idAsistencia;
    private Long elevador;
    private List<MecanicoAsistenciaDto> mecanicos;
    private List<HorariosAsistenciasDto> horarios;
    private String fecha;
    private Long idTrabajo;
    private Float precio;
    private Long duracionEstimada;
    private Boolean peritaje;
    private String descripcion;

    public AsistenciaCompletaDto() {
    }

    public AsistenciaCompletaDto(Long idAsistencia, Long elevador, List<MecanicoAsistenciaDto> mecanicos, List<HorariosAsistenciasDto> horarios, String fecha, Long idTrabajo, Float precio, Long duracionEstimada, Boolean peritaje, String descripcion) {
        this.idAsistencia = idAsistencia;
        this.elevador = elevador;
        this.mecanicos = mecanicos;
        this.horarios = horarios;
        this.fecha = fecha;
        this.idTrabajo = idTrabajo;
        this.precio = precio;
        this.duracionEstimada = duracionEstimada;
        this.peritaje = peritaje;
        this.descripcion = descripcion;
    }

    public Long getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(Long idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public Long getElevador() {
        return elevador;
    }

    public void setElevador(Long elevador) {
        this.elevador = elevador;
    }

    public List<MecanicoAsistenciaDto> getMecanicos() {
        return mecanicos;
    }

    public void setMecanicos(List<MecanicoAsistenciaDto> mecanicos) {
        this.mecanicos = mecanicos;
    }

    public List<HorariosAsistenciasDto> getHorarios() {
        return horarios;
    }

    public void setHorarios(List<HorariosAsistenciasDto> horarios) {
        this.horarios = horarios;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Long getIdTrabajo() {
        return idTrabajo;
    }

    public void setIdTrabajo(Long idTrabajo) {
        this.idTrabajo = idTrabajo;
    }

    public Float getPrecio() {
        return precio;
    }

    public void setPrecio(Float precio) {
        this.precio = precio;
    }

    public Long getDuracionEstimada() {
        return duracionEstimada;
    }

    public void setDuracionEstimada(Long duracionEstimada) {
        this.duracionEstimada = duracionEstimada;
    }

    public Boolean getPeritaje() {
        return peritaje;
    }

    public void setPeritaje(Boolean peritaje) {
        this.peritaje = peritaje;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
