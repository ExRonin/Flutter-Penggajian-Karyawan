'use strict';
module.exports = (sequelize, DataTypes) => {
    const jabatan = sequelize.define('jabatan', {
        id_jabatan: {
            allowNull: false,
            autoIncrement: true,
            primaryKey: true,
            type: DataTypes.INTEGER,
        },
        nama_jabatan: DataTypes.STRING,
        gaji_pokok: DataTypes.INTEGER,
        upah_lembur: DataTypes.INTEGER,
    }, {
        timestamps: false,
        freezeTableName: true,
        tableName: 'tbl_jabatan',
    });
    jabatan.associate = function(models) {
        // associations can be defined here
    };
    return jabatan;
};