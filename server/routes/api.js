const express = require('express');
const router = express.Router();
const karyawan = require('../models/index').karyawan;
const gaji = require('../models/index').gaji;
const jabatan = require('../models/index').jabatan;

gaji.belongsTo(karyawan, { foreignKey: 'id_karyawan' })
karyawan.belongsTo(jabatan, { foreignKey: 'id_jabatan' })

const login = async(req, res, next) => {
    try {
        const data = await karyawan.findOne({
            include: [jabatan],
            where: {
                username: req.body.username,
                password: req.body.password
            },
        });
        const listGaji = await gaji.findAll({
            where: {
                id_karyawan: data.id_karyawan
            },
            order: [
                ['tahun', 'DESC'],
                ['bulan', 'DESC'],
            ],
        })
        if (data.length !== 0) {
            res.json({
                'status': 'OK',
                'messages': 'Berhasil Login',
                'data': data,
                'listGaji': listGaji
            })
        } else {
            res.json({
                'status': 'ERROR',
                'messages': 'EMPTY',
                'data': data
            }, 500)
        }
    } catch (err) {
        res.json({
            'status': 'ERROR',
            'messages': err,
            'data': {}
        })
    }
}
router.post('/login', login);

module.exports = router;