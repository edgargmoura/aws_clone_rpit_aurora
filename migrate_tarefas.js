'use strict';

module.exports = {
    async up(queryInterface, Sequelize) {
        await queryInterface.changeColumn('Tarefas', 'titulo', {
            type: Sequelize.STRING(100),
            allowNull: false,
        });
    },

    async down(queryInterface, Sequelize) {
        await queryInterface.changeColumn('Tarefas', 'titulo', {
            type: Sequelize.STRING(255),
            allowNull: false,
        });

    }
};