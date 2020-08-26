'use strict';
module.exports = (sequelize, DataTypes) => {
    const gaji = sequelize.define('gaji', {
        id_gaji: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: DataTypes.INTEGER,
        },
        id_karyawan: DataTypes.INTEGER,
        gaji_kotor: DataTypes.INTEGER,
        jam_lembur: DataTypes.INTEGER,
        jumlah_lembur: DataTypes.INTEGER,
        pajak: DataTypes.INTEGER,
        total_tunjangan: DataTypes.INTEGER,
        gaji_bersih: DataTypes.INTEGER,
        bulan: DataTypes.INTEGER,
        tahun: DataTypes.INTEGER,
    }, {
        timestamps: false,
        freezeTableName: true,
        tableName: 'tbl_gaji',
    });
    gaji.associate = function(models) {
        // associations can be defined here
    };
    return gaji;
};