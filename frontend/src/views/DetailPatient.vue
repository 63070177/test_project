<template>
  <div class="row g-0 text-center">
    <nav style="background-color: #1c2939">
      <div class="container">
        <div class="row">
          <div class="col-9">
            <ul class="nav nav-underline">
              <li  v-if="user.type == 'nurse'"
                class="nav-item"
                @click="goToRegis()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a class="nav-link" href="#" style="color: #ffffff"
                  >ลงทะเบียนผู้ป่วย</a
                >
              </li>
              <li
                class="nav-item"
                @click="goTonewHome()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a class="nav-link" href="#" style="color: #ffffff">ผลเลือด</a>
              </li>
              <li
                class="nav-item"
                @click="goTonewAppoint()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a class="nav-link" href="#" style="color: #ffffff">นัดหมาย</a>
              </li>
              <li
                class="nav-item"
                @click="goToPatient()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a
                  class="nav-link active"
                  aria-current="page"
                  href="#"
                  style="color: #ffffff; font-size: large"
                  >ประวัติการรักษา</a
                >
              </li>
              <li
                class="nav-item"
                @click="goToMedFor()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a class="nav-link" href="#" style="color: #ffffff">สูตรยาเคมีบำบัด</a>
              </li>
              <li
                class="nav-item"
                @click="goToguideBook()"
                style="margin-top: 10px; margin-bottom: 10px; padding-right: 20px"
              >
                <a class="nav-link" href="#" style="color: #ffffff">คู่มือผู้ป่วย</a>
              </li>
            </ul>
          </div>
          <div class="col-3">
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
              <button @click="logOut()"
                class="btn btn-light me-md-2"
                type="button"
                style="margin-top: 15px; margin-bottom: 10px"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  class="bi bi-box-arrow-in-right"
                  viewBox="0 0 16 16"
                >
                  <path
                    fill-rule="evenodd"
                    d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"
                  />
                  <path
                    fill-rule="evenodd"
                    d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"
                  />
                </svg>
                ออกจากระบบ
              </button>
            </div>
          </div>
        </div>
      </div>
    </nav>
    <div class="col-md-10 offset-md-1">
      <div class="bd-example-snippet bd-code-snippet" style="border: none">
        <div class="card" style="margin: 20px">
          <div class="card-body" style="text-align: left">
            <button
              type="button"
              style="margin-bottom: 20px"
              class="btn btn-outline-success"
              @click="goToPatient()"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="16"
                height="16"
                fill="currentColor"
                class="bi bi-chevron-left"
                viewBox="0 0 16 16"
              >
                <path
                  fill-rule="evenodd"
                  d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"
                />
              </svg>
              ย้อนกลับ
            </button>
            <div class="container" style="margin-bottom: 20px">
              <div class="row g-0">
                <div class="col-4">
                  <b>ชื่อ-นามสกุล</b> {{ patient.prefix }}{{ patient.firstName }}
                  {{ patient.lastName }}
                </div>
                <div class="col-4"><b>เพศ</b> {{ patient.gender }}</div>
                <div class="col-4"><b>อายุ</b> {{ patient.age }} ปี</div>
              </div>
            </div>
            <div class="container" style="margin-bottom: 20px">
              <div class="row g-0">
                <div class="col-4"><b>ชนิดมะเร็ง</b> {{ patient.cancerType }}</div>
                <div class="col-4">
                  <b>ระยะของโรค</b> ระยะที่ {{ patient.cancerState }}
                </div>
                <div class="col-4"><b>สถานะ</b> {{ patient.status }}</div>
              </div>
            </div>
            <div class="container" style="margin-bottom: 40px">
              <div class="row g-0">
                <div class="col-4"><b>หมายเลขโทรศัพท์</b> {{ patient.phoneNumber }}</div>
                <div class="col-4"><b>สูตรยาที่ได้รับ</b> {{ patient.formulaName }}</div>
                <div class="col-4">
                  <b>แพทย์ผู้ดูแล</b> {{ doctor.firstName }} {{ doctor.lastName }}
                </div>
              </div>
            </div>
            <div class="container" style="margin-bottom: 20px">
              <div class="row g-0">
                <div class="col-2">
                  <b>โรคประจำตัว</b>
                </div>
                <div class="col">
                  <label v-if="patientDisease.disease != ''">{{
                    patientDisease.disease
                  }}</label>
                  <label v-if="patientDisease.disease == ''">ไม่มีโรคประจำตัว</label>
                </div>
                <div class="col-2">
                  <b>ยาที่กินประจำ</b>
                </div>
                <div class="col">
                  <label v-if="patientDisease.usualMed == ''">ไม่มียาที่กินประจำ</label>
                  <label v-if="patientDisease.usualMed != ''">{{
                    patientDisease.usualMed
                  }}</label>
                </div>
              </div>
            </div>
            <div class="container" style="margin-bottom: 20px">
              <div class="row g-0">
                <div class="col-2">
                  <b>ประวัติการแพ้</b>
                </div>
                <div class="col">
                  <label v-if="patient.allergy == 'ไม่เคยแพ้'">ไม่มีประวัติการแพ้</label>
                  <label v-if="patient.allergy == 'แพ้'">{{
                    patient.allergyDetail
                  }}</label>
                </div>
                <div class="col-2">
                  <b>การรักษาอื่นๆ</b>
                </div>
                <div class="col">
                  <label v-if="patientDisease.otherTreatment == null"
                    >ไม่มีประวัติการรักษาอื่น ๆ
                  </label>
                  <label v-if="patientDisease.otherTreatment != ''">{{
                    patientDisease.otherTreatment
                  }}</label>
                </div>
              </div>
            </div>
            <div style="margin-top: 80px" v-for="t in treatment" :key="t.treatmentId">
              <div class="row">
                <div class="col-4">
                  <label style="font-size: 1.17rem"
                    ><b>แผนการรักษา :</b> {{ t.cancerType }}</label
                  >
                </div>
                <div class="col-4">
                  <label style="font-size: 1.17rem"
                    ><b>สูตรยา :</b> {{ t.formulaName }}</label
                  >
                </div>
                <div class="col-4">
                  <label style="font-size: 1.17rem"
                    ><b>แพทย์ผู้ดูแล :</b> {{ t.doctor }}</label
                  >
                </div>
              </div>
              <table class="table">
                <thead>
                  <tr class="table-info">
                    <th scope="col">วันที่รับยา</th>
                    <th scope="col">ครั้งที่</th>
                    <th scope="col">ยาเคมีบำบัดที่ได้รับ</th>
                    <th scope="col">ผลข้างเคียง(คนไข้)</th>
                    <th scope="col">ระดับผลข้างเคียง</th>
                    <th scope="col">หมายเหตุ</th>
                  </tr>
                </thead>
                <tbody>
                  <tr
                    class="table-group-divider"
                    v-for="appoint in appointment"
                    :key="appoint.appointId"
                  >
                    <td>
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="16"
                        height="16"
                        fill="currentColor"
                        class="bi bi-calendar3"
                        viewBox="0 0 16 16"
                      >
                        <path
                          d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z"
                        />
                        <path
                          d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"
                        />
                      </svg>
                      {{ appoint.thaiAppointDate }}
                    </td>
                    <td>{{ appoint.appoint_no }}</td>
                    <td>
                      <div class="row" v-for="s in shouldDisplay" :key="s.appointId">
                        {{ s.medName }} {{ s.unit }} มก. <br />
                      </div>
                    </td>
                    <td>
                      <label v-if="appoint.patientSideEffect != null">{{
                        appoint.patientSideEffect
                      }}</label>
                      <label v-if="appoint.patientSideEffect == null"
                        >คนไข้ยังไม่บันทึกผลข้างเคียง</label
                      >
                    </td>
                    <td>
                      <label v-if="appoint.sideEfflevel != null"
                        >ระดับที่ {{ appoint.sideEfflevel }}</label
                      >
                      <label v-if="appoint.sideEfflevel == null">ยังไม่มีการบันทึก</label>
                    </td>
                    <td>{{ appoint.note }}</td>
                  </tr>
                </tbody>
              </table>
              <div v-if="user.type == 'doctor'"
                class="d-grid gap-2 d-md-flex"
                style="display: flex; justify-content: flex-end; right: 0"
              >
                <button v-if="t.treatmentStatus != 'สิ้นสุดแผนการรักษา'"
                  class="btn btn-warning"
                  :disabled="appointment.length != t.numberOfRound"
                  data-bs-target="#exampleModal"
                  data-bs-toggle="modal"
                >
                  เปลี่ยนสูตรยา
                </button>
                <button v-if="t.treatmentStatus != 'สิ้นสุดแผนการรักษา'" class="btn btn-success" @click="endTreatment(t)">
                  จบแผนการรักษา
                </button>
              </div>
              <div
                class="modal fade"
                id="exampleModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
              >
                <div class="modal-dialog modal-lg">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h1 class="modal-title fs-5" id="exampleModalLabel">
                        เพิ่มแผนการรักษา
                      </h1>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputFirstname" class="col-sm-3 col-form-label"
                          >ชื่อ</label
                        >
                        <div class="col-sm-8">
                          <input disabled
                            type="text"
                            class="form-control"
                            id="inputText"
                            v-model="patient.firstName"
                          />
                        </div>
                      </div>
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputFirstname" class="col-sm-3 col-form-label"
                          >นามสกุล</label
                        >
                        <div class="col-sm-8">
                          <input disabled
                            type="text"
                            class="form-control"
                            id="inputText"
                            v-model="patient.lastName"
                          />
                        </div>
                      </div>
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputType" class="col-sm-3 col-form-label"
                          >ประเภทมะเร็ง</label
                        >
                        <div class="col-sm-8">
                          <!--<input class="form-control" list="cancerType" type="text" v-model="cancerType">
                          <datalist id="cancerType">
                            <option v-for="(c, index) in infoCancer" :key="index">{{c}}</option>
                          </datalist>-->
                          <select class="form-select" v-model="cancerType">
                            <option value="" disabled>กรุณาเลือกประเภทมะเร็ง</option>
                            <option v-for="(c, index) in infoCancer" :key="index">
                              {{ c }}
                            </option>
                          </select>
                        </div>
                      </div>
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputState" class="col-sm-3 col-form-label"
                          >ระยะของโรค</label
                        >
                        <div class="col-sm-8">
                          <!--<input type="text" class="form-control" id="inputText" v-model="cancerState">-->
                          <select class="form-select" v-model="cancerState">
                            <option value="" disabled>กรุณาเลือกระยะมะเร็ง</option>
                            <option v-for="index in 4" :key="index">{{ index }}</option>
                          </select>
                        </div>
                      </div>
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputState" class="col-sm-3 col-form-label"
                          >สูตรยา</label
                        >
                        <div class="col-sm-8">
                          <select class="form-select" v-model="formula">
                            <option value="" disabled>กรุณาเลือกสูตรยา</option>
                            <option v-for="formula in formulas" :key="formula.formulaId">
                              {{ formula.formulaName }}
                            </option>
                          </select>
                        </div>
                      </div>
                      <div class="mb-3 row" style="text-align: left">
                        <label for="inputState" class="col-sm-3 col-form-label"
                          >แพทย์ผู้ดูแล</label
                        >
                        <div class="col-sm-8">
                          <select class="form-select" v-model="doctor">
                            <option value="" disabled>กรุณาเลือกแพทย์ผู้ดูแล</option>
                            <option v-for="doc in doctors" :key="doc.doctorId">
                              {{ doc.firstName }} {{ doc.lastName }}
                            </option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button
                        type="button"
                        class="btn btn-danger"
                        data-bs-dismiss="modal"
                        @click="goNo()"
                      >
                        ยกเลิก
                      </button>
                      <button
                        @click="changeFormula(t)"
                        type="button"
                        class="btn btn-success"
                        data-bs-dismiss="modal"
                      >
                        ตกลง
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import moment from "moment";
export default {
  name: "DetailPatient",
  data() {
    return {
      showOverlay: false,
      showOverlay1: false,
      patient: [],
      formula: "",
      doctor: "",
      bloodresult: [],
      selectedBloodresult: [],
      img: "",
      status: "",
      note: "",
      appointment: [],
      medicine: [],
      amount: [],
      medType: "",
      tab: [],
      disease: "",
      usualMed: "",
      allergyMed: "",
      otherTreatment: "",
      patientDisease: [],
      giveMed: [],
      treatment: [],
      historyTreatment: [],
      doctors: [],
      formulas: [],
      cancerType: "",
      cancerState: "",
      infoCancer: ['มะเร็งปอด', 'มะเร็งกระเพาะอาหาร', 'มะเร็งลำไส้ใหญ่', 'มะเร็งตับ', 'มะเร็งตับอ่อน', 
      'มะเร็งต่อมไทรอยด์', 'มะเร็งไต', 'มะเร็งกระเพาะปัสสาวะ', 'มะเร็งอัณฑะ', 'มะเร็งต่อมลูกหมาก', 
      'มะเร็งถุงน้ำดี', 'มะเร็งมดลูก', 'มะเร็งเต้านม', 'มะเร็งรังไข่'],
      user: []
    };
  },
  mounted() {
    let userId = this.$route.params.userId
    axios.get(`http://localhost:3000/user/${userId}`).then((response) => {
      this.user = response.data[0]
    }).catch((error) => {
      console.log(error)
    })
    const HN = this.$route.params.HN;
    const treatmentId = this.$route.params.treatmentId
    axios
      .get(`http://localhost:3000/patient/${HN}/${treatmentId}`)
      .then((response) => {
        console.log(response.data);
        this.patient = response.data[0];
        let page = moment().format("YYYY") - this.patient.birthDate.split("-")[0];
        this.patient["age"] = page;
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/myformula/${HN}/${treatmentId}`)
      .then((response) => {
        this.patient["formulaName"] = response.data[0].formulaName;
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/doctor/${HN}`)
      .then((response) => {
        this.doctor = response.data[0];
      })
      .catch((error) => {
        console.log(error);
      });
    axios.get(`http://localhost:3000/getDiseases/${HN}`).then((response) => {
      if (response.data.length == 0) {
        this.patientDisease = [];
      } else {
        this.patientDisease = response.data[0];
      }
    });
    axios
      .get(`http://localhost:3000/AlltreatmentHistory/${HN}/${treatmentId}`)
      .then((response) => {
        this.appointment = response.data;
        for (let i = 0; i < this.appointment.length; i++) {
          this.appointment[i].thaiAppointDate = this.convertToThaiDate(
            this.appointment[i].appointDate
          );
          axios
            .get(`http://localhost:3000/myformula/${this.appointment[i].HN}/${this.appointment[i].treatmentId}`)
            .then((response) => {
              this.appointment[i].formulaName = response.data[0].formulaName;
            })
            .catch((error) => {
              console.log(error);
            });
        }
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/giveMed/${HN}`)
      .then((response) => {
        this.giveMed = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/currentTreatment/${HN}/${treatmentId}`)
      .then((response) => {
        this.treatment = response.data;
        for (let i = 0; i < this.treatment.length; i++) {
          axios
            .get(`http://localhost:3000/treatmentDoctor/${this.treatment[i].doctorId}`)
            .then((response) => {
              this.treatment[i]["doctor"] =
                response.data[0].firstName + " " + response.data[0].lastName;
            })
            .catch((error) => {
              console.log(error);
            });
        }
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/doctor`)
      .then((response) => {
        this.doctors = response.data;
      })
      .catch((error) => {
        console.log(error);
      });
    axios
      .get(`http://localhost:3000/Allformula`)
      .then((response) => {
        this.formulas = response.data;
        console.log(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  },
  methods: {
    changeFormula(t) {
      const treatmentId = t.treatmentId;
      if (
        this.cancerType != "" &&
        this.cancerState != "" &&
        this.formula != "" &&
        this.doctor != ""
      ) {
        axios
          .put(`http://localhost:3000/endTreatment/${treatmentId}`)
          .then((response) => {
            console.log(response.data);
            this.historyTreatment = response.data;
          })
          .catch((error) => {
            console.log(error);
          });
        const data = {
          cancerType: this.cancerType,
          cancerState: this.cancerState,
          firstName: this.patient.firstName,
          lastName: this.patient.lastName,
          formula: this.formula,
          doctor: this.doctor,
        };
        axios
          .post(`http://localhost:3000/createTreatment`, data)
          .then((response) => {
            console.log(response.data);
          })
          .catch((error) => {
            console.log(error);
          });
      }else{
        alert('กรุณากรอกข้อมูลให้ครบ')
      }
    },
    endTreatment(t) {
      const treatmentId = t.treatmentId;
      let text = "คุณยืนยันที่จะจบแผนการรักษาหรือไม่";
      if (confirm(text) == true) {
        axios
          .put(`http://localhost:3000/endTreatment/${treatmentId}`)
          .then((response) => {
            console.log(response.data);
            this.$router.go(this.$router.currentRoute);
          })
          .catch((error) => {
            console.log(error);
          });
      }
    },
    convertToThaiDate(date) {
      let splitDate = date.split("-");
      let day = splitDate[2].split("T")[0];
      let month = splitDate[1];
      let year = splitDate[0];
      let thDate = new Date(year, Number(month) - 1, day);
      const result = thDate.toLocaleDateString("th-TH", {
        year: "numeric",
        month: "long",
        day: "numeric",
      });
      return result;
    },
    addDisease() {
      const data = {
        HN: this.$route.params.HN,
        disease: this.disease,
        usualMed: this.usualMed,
        allergyMed: this.allergyMed,
        otherTreatment: this.otherTreatment,
      };
      axios
        .post(`http://localhost:3000/addDisease`, data)
        .then((response) => {
          this.patientDisease = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    logOut(){
      this.$router.replace('/');
    },
    goToguideBook() {
      this.$router.push(`/guideBook/${this.$route.params.userId}`);
    },
    goToRegis() {
      this.$router.push(`/RegisPatient/${this.$route.params.userId}`);
    },
    goTonewHome() {
      this.$router.push(`/HomePage/${this.$route.params.userId}`);
    },
    goToBlood() {
      this.$router.push("/HomePage");
    },
    goToMedFor() {
      this.$router.push(`/MedFormular/${this.$route.params.userId}`);
    },
    goToPatient() {
      this.$router.push(`/YourPatients/${this.$route.params.userId}`);
    },
    goBack() {
      this.$router.push(`/YourPatients/${this.$route.params.userId}`);
    },
    goToReport() {
      this.$router.push("/ReportResult");
    },
    goTonewAppoint() {
      this.$router.push(`/appointmentView/${this.$route.params.userId}`);
    },
    addAppoint() {
      this.showOverlay = !this.showOverlay;
    },
    goYes() {
      this.showOverlay = !this.showOverlay;
    },
    goNo() {
      this.showOverlay = !this.showOverlay;
    },
    goYesMod() {
      this.showOverlay1 = !this.showOverlay1;
    },
    goNoMod() {
      this.showOverlay1 = !this.showOverlay1;
    },
    overlayModapp() {
      this.showOverlay1 = !this.showOverlay1;
    },
    openIMG(blood) {
      this.img = "http://localhost:3000/" + blood.picture;
      this.selectedBloodresult = blood;
      this.status = this.patient.status;
      const formulaId = this.patient.formulaId;
      axios
        .get(`http://localhost:3000/medicine/${formulaId}`)
        .then((response) => {
          this.medicine = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
    },
    saveComment() {
      const data2 = {
        medType: this.medType,
        amount: this.amount,
        formulaId: this.patient.formulaId,
        treatmentId: this.patient.treatmentId,
        HN: this.patient.HN,
        tab: this.tab,
        result: this.status,
        detail: this.note,
        doctorId: this.$route.params.userId,
        brId: this.selectedBloodresult.brId,
      };
      axios
        .post(`http://localhost:3000/giveMed`, data2)
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  computed: {
    imgPath() {
      return this.img;
    },
    shouldDisplay() {
      return this.giveMed.filter((r) => {
        for (let i = 0; i < this.appointment.length; i++) {
          return r.appoint_no == this.appointment[i].appoint_no;
        }
      });
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.group {
  padding: 20px;
}

.g1 {
  margin-right: 20px;
}
</style>
