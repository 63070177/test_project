const express = require('express');
const pool = require('../config');
const app = express()
const cors = require('cors');

app.use(cors());

router = express.Router();
/*
router.get('/bloodresult/:userId', async function (req, res, next) {
    let data = new Array()
    let userId = req.params.userId
    const [row1, f1] = await pool.query('select * from user where userId = ?', userId)
    
    try {
        if (row1[0].type == 'nurse' || row1[0].type == 'admin') {
            const [row, _] = await pool.query('select HN, max(brId) as brId from bloodresult group by HN')
            if (row.length != 0) {
                for (let i = 0; i < row.length; i++) {
                    const [rows, _] = await pool.query('select * from bloodresult where HN = ?', row[i].HN)
                    data.push(rows[0])
                }
            }
        } else if (row1[0].type == 'doctor'){
            //const [rows, _] = await pool.query('select * from bloodresult join patient on bloodresult.HN=patient.HN where patient.doctorId = ?', userId)
            //data.push(rows)
            const [row, f] = await pool.query('select HN, max(brId) as brId from bloodresult where patient.doctorId = ? group by HN')
            if (row.length != 0) {
                for (let i = 0; i < row.length; i++) {
                    const [rows, _] = await pool.query('select * from bloodresult join patient on bloodresult.HN=patient.HN where patient.doctorId = ?', userId)
                    data.push(rows[0])
                }
            }
        }
        res.json(data)
    } catch (error) {
        console.log(error)
    }
    try {
        const [row, _] = await pool.query('select * from bloodresult join patient on bloodresult.HN=patient.HN')
        res.json(row)
    } catch (error) {
        console.log(error)
    }
})

router.get('/bloodresult/patient/:HN', async function (req, res, next) {
    const HN = req.params.HN
    try {
        const [row, _] = await pool.query('select * from bloodresult where HN = ?', HN)
        if (row.length == 0) {
            res.send('not found')
        }else{
            res.json(row)
        }
    } catch (error) {
        
    }
})

router.post('/sortInfoBlood', async function (req, res, next) {
    let data = new Array();
    const sortInfoAppoint = req.body.sortInfo
    try {
        if (sortInfoAppoint == '1') {
            const [rows, _] = await pool.query('select patient.*, bloodresult.HN, max(brId) from bloodresult left join patient on patient.HN=bloodresult.HN group by bloodresult.HN order by patient.firstName asc')
            data.push(rows)
            console.log(rows)
        } else if (sortInfoAppoint == '2') {
            const [rows1, _] = await pool.query('select patient.*, bloodresult.HN, max(brId) from bloodresult left join patient on patient.HN=bloodresult.HN group by bloodresult.HN order by patient.firstName desc')
            data.push(rows1)
        } else if (sortInfoAppoint == '3') {
            const [rows2, _] = await pool.query('select patient.*, bloodresult.HN, max(brId) from bloodresult left join patient on patient.HN=bloodresult.HN group by bloodresult.HN order by patient.HN asc')
            data.push(rows2)
        } else if (sortInfoAppoint == '4') {
            const [rows3, _] = await pool.query('select patient.*, bloodresult.HN, max(brId) from bloodresult left join patient on patient.HN=bloodresult.HN group by bloodresult.HN order by patient.HN desc')
            data.push(rows3)
        }
        console.log(data)
        res.json(data)
    } catch (error) {
        console.log(error)
    }
})

router.post('/selectedBlood', async function (req, res, next) {
    let data = new Array();
    const selected = req.body.selected
    try {
        if (selected == '') {
            const [row, _] = await pool.query('select HN, max(brId) as brId from bloodresult group by HN')
        }
        const [rows, f] = await pool.query('SELECT * FROM bloodResult WHERE HN=?', selected)
        const [rows1, f1] = await pool.query('select * from bloodresult join patient on bloodresult.HN=patient.HN where firstName like ? or lastName like ?', [`%${selected}%`, `%${selected}%`])
        const [rows2, f2] = await pool.query('select * from bloodresult join patient on bloodresult.HN=patient.HN where cancerType like ?', [`%${selected}%`])
        if (rows.length != 0) {
            data.push(rows);
        } else if (rows1.length != 0) {
            data.push(rows1)
        } else if (rows2.length != 0) {
            data.push(rows2)
        }
        if (data.length != 0) {
            res.json(data)
        } else {
            res.send('ไม่พบรายชื่อที่ค้นหา')
        }
    } catch (error) {
        console.log(error)
    }
})
*/

router.get('/bloodresult/patient/:HN/:treatmentId', async function (req, res, next) {
    const HN = req.params.HN
    const treatmentId = req.params.treatmentId
    try {
        const [row, _] = await pool.query('select * from bloodresult join treatment on treatment.treatmentId=bloodresult.treatmentId where treatment.HN = ? and treatment.treatmentId = ? order by brId desc', [HN, treatmentId])
        if (row.length == 0) {
            res.send('not found')
        }else{
            res.json(row)
        }
    } catch (error) {
        
    }
})

router.get('/picture/:HN', async function (req, res, next) {
    const HN = req.params.HN
    try {
        const [row, _] = await pool.query('select max(brId) as brId, picture from bloodresult join treatment on treatment.treatmentId=bloodresult.treatmentId where treatment.HN = ? group by brId', HN)
        if (row.length == 0){
            res.send('not found')
        }else{
            res.json(row)
        }
    } catch (error) {
        console.log(error)
    }
})

router.post(`/sortBloodresult`, async function (req, res, next){
    const sortBlood = req.body.sortBlood
    let data = new Array
    try {
        if (sortBlood == '1'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId order by firstName asc`)
            data.push(row)
        }else if (sortBlood == '2'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId order by firstName desc`)
            data.push(row)
        }else if (sortBlood == '3'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId order by bloodresult.date is null, bloodresult.status = 'อนุมัติผลเลือด', date asc`)
            data.push(row)
        }else if (sortBlood == '4'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId order by bloodresult.date is null, bloodresult.status = 'อนุมัติผลเลือด', date desc`)
            data.push(row)
        }else if (sortBlood == '5'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId where bloodresult.status = 'รออนุมัติผลเลือด' order by date`)
            data.push(row)
        }else if (sortBlood == '6'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId where bloodresult.status = 'อนุมัติผลเลือด' order by date`)
            data.push(row)
        }else if (sortBlood == '7'){
            const [row, _] = await pool.query(`select * from treatment left join patient on patient.HN=treatment.HN join bloodresult on treatment.treatmentId=bloodresult.treatmentId where bloodresult.status = 'ส่งผลเลือดอีกครั้ง' order by date`)
            data.push(row)
        }
        res.json(data)
    } catch (error) {
        console.log(error)
    }
})

router.get(`/getBloodresult/:brId`, async function (req, res, next){
    try {
        const [row, f] = await pool.query(`select * from bloodresult where brId = ?` , req.params.brId)
        res.json(row[0])
    } catch (error) {
        console.log(error)
    }
})

exports.router = router;