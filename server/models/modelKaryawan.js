'use strict';
module.exports = (sequelize, DataTypes) => {
    const karyawan = sequelize.define('karyawan', {
        id_karyawan: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: DataTypes.INTEGER,
        },
        nama_karyawan: DataTypes.STRING,
        alamat: DataTypes.TEXT,
        no_hp: DataTypes.STRING,
        tmp_lahir: DataTypes.STRING,
        tgl_lahir: DataTypes.STRING,
        jk: DataTypes.STRING,
        id_jabatan: DataTypes.INTEGER,
        status_nikah: DataTypes.INTEGER,
        jml_anak: DataTypes.INTEGER,
        username: DataTypes.STRING,
        password: DataTypes.TEXT,
    }, {
        timestamps: false,
        freezeTableName: true,
        tableName: 'tbl_karyawan',
    });
    karyawan.associate = function(models) {
        // associations can be defined here
    };
    return karyawan;
};