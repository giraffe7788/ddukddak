package kr.or.dduk.vo;

import lombok.Data;

@Data
public class DataWrapper {
	public ClinicChartVO clinicChartVO;
	public AdmissionChartVO admissionChartVO;
	public PatientVO patientVO;
	public AdmissionRoomVO admissionRoomVO;
	public ReservationVO reservationVO;
	public DocScheduleVO docScheduleVO;
	public TreatmentRoomVO treatmentRoomVO;
}
