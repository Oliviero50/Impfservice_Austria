package com.example.impservice.model;

public class VaccineShotDTO {
    private long patientId;
    private long vaccinationCentre;
    private long packageId;
    private long doctorId;

    public long getPatientId() {
        return patientId;
    }

    public void setPatientId(long patientId) {
        this.patientId = patientId;
    }

    public long getVaccinationCentre() {
        return vaccinationCentre;
    }

    public void setVaccinationCentre(long vaccinationCentre) {
        this.vaccinationCentre = vaccinationCentre;
    }

    public long getPackageId() {
        return packageId;
    }

    public void setPackageId(long packageId) {
        this.packageId = packageId;
    }

    public long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(long doctorId) {
        this.doctorId = doctorId;
    }
}
