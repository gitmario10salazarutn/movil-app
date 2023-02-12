# -*- coding: utf-8 -*-
"""
Created on Thu Nov  3 11:28:03 2022

@author: Mario
"""

from database import connectdb as conn
from .entities import Entities as entities
import json

connection = conn.get_connection()


class Model:

    @classmethod
    def get_points(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from punto")
            res = cursor.fetchall()
            connection.close()
            points = []
            for result in res:
                point = {
                    "id_punto": result[0],
                    "coord_x": result[1],
                    "coord_y": result[2]
                }
                points.append(point)
            return points
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_lines(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_lines;")
            res = cursor.fetchall()
            connection.close()
            lines = []
            for result in res:
                line = {
                    "recta": {
                        "id_recta": result[0]
                    },
                    "punto_a": {
                        "id_punto": result[1],
                        "coord_x": result[2],
                        "coord_y": result[3]
                    },
                    "punto_b": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                lines.append(line)
            return lines
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_circunferences(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_circunferences;")
            res = cursor.fetchall()
            connection.close()
            circunferences = []
            for result in res:
                circunference = {
                    "circunferencia": {
                        "id_circunferencia": result[0],
                        "radio": result[1]
                    },
                    "centro": {
                        "id_punto": result[2],
                        "coord_x": result[3],
                        "coord_y": result[4]
                    }
                }
                circunferences.append(circunference)
            return circunferences
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elipses(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_elipses;")
            res = cursor.fetchall()
            connection.close()
            elipses = []
            for result in res:
                elipse = {
                    "elipse": {
                        "id_elipse": result[0],
                        "a": result[1],
                        "b": result[2],
                        "eje_focal": result[3]
                    },
                    "centro": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                elipses.append(elipse)
            return elipses
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_hiperbolas(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_hiperbolas;")
            res = cursor.fetchall()
            connection.close()
            hiperbolas = []
            for result in res:
                hiperbola = {
                    "hiperbola": {
                        "id_hiperbola": result[0],
                        "a": result[1],
                        "b": result[2],
                        "eje_focal": result[3]
                    },
                    "centro": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                hiperbolas.append(hiperbola)
            return hiperbolas
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_parabolas(self):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_parabolas;")
            res = cursor.fetchall()
            connection.close()
            parabolas = []
            for result in res:
                parabola = {
                    "parabola": {
                        "id_parabola": result[0],
                        "p": result[1],
                        "eje_focal": result[2]
                    },
                    "vertice": {
                        "id_punto": result[3],
                        "coord_x": result[4],
                        "coord_y": result[4]
                    }
                }
                parabolas.append(parabola)
            return parabolas
        except Exception as ex:
            raise Exception(ex)


# GET BY ID

    @classmethod
    def get_point_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute(
                "select*from punto where id_punto = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            r = []
            if result is not None:
                point = {
                    "id_punto": result[0],
                    "coord_x": result[1],
                    "coord_y": result[2]
                }
                r.append(point)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_line_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute("select*from get_lines where id = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            if result is not None:
                r = []
                line = {
                    "recta": {
                        "id_recta": result[0]
                    },
                    "punto_a": {
                        "id_punto": result[1],
                        "coord_x": result[2],
                        "coord_y": result[3]
                    },
                    "punto_b": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                r.append(line)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_circunference_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute(
                "select*from get_circunferences where id = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            if result is not None:
                r = []
                circunference = {
                    "circunferencia": {
                        "id_circunferencia": result[0],
                        "radio": result[1]
                    },
                    "centro": {
                        "id_punto": result[2],
                        "coord_x": result[3],
                        "coord_y": result[4]
                    }
                }
                r.append(circunference)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elipse_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute(
                "select*from get_elipses where id = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            if result is not None:
                r = []
                elipse = {
                    "elipse": {
                        "id_elipse": result[0],
                        "a": result[1],
                        "b": result[2],
                        "eje_focal": result[3]
                    },
                    "centro": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                r.append(elipse)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_hiperbola_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute(
                "select*from get_hiperbolas where id = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            if result is not None:
                r = []
                hiperbola = {
                    "hiperbola": {
                        "id_hiperbola": result[0],
                        "a": result[1],
                        "b": result[2],
                        "eje_focal": result[3]
                    },
                    "centro": {
                        "id_punto": result[4],
                        "coord_x": result[5],
                        "coord_y": result[6]
                    }
                }
                r.append(hiperbola)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_parabola_byid(self, id):
        try:
            connection = conn.get_connection()
            cursor = connection.cursor()
            cursor.execute(
                "select*from get_parabolas where id = {0};".format(id))
            result = cursor.fetchone()
            connection.close()
            if result is not None:
                r = []
                parabola = {
                    "parabola": {
                        "id_parabola": result[0],
                        "p": result[1],
                        "eje_focal": result[2]
                    },
                    "vertice": {
                        "id_punto": result[3],
                        "coord_x": result[4],
                        "coord_y": result[4]
                    }
                }
                r.append(parabola)
            else:
                r = None
            return r
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_point(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                rows_affects = cursor.rowcount
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                connection.commit()
                if rows_affects > 0:
                    point = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    return point.convert_to_json()
                else:
                    return {'message': 'Error, Insert failed!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_line(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_xa'], data['coord_ya']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point_a = cursor.fetchone()[0]
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_xb'], data['coord_yb']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point_b = cursor.fetchone()[0]
                cursor.execute("INSERT INTO recta(punto_a, punto_b) values({0}, {1})".format(
                    id_point_a, id_point_b))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_line = cursor.fetchone()[0]
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point_a, data['coord_xa'], data['coord_ya'])
                    b = entities.Punto(
                        id_point_b, data['coord_xb'], data['coord_yb'])
                    line = entities.Recta(id_line, a, b)
                    return line.convert_to_json()
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_circunference(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("INSERT INTO circunferencia(centro, radio) values({0}, {1})".format(
                    id_point, data['radio']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_circunference = cursor.fetchone()[0]
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    circunference = entities.Circunferencia(
                        id_circunference, a, data['radio'])
                    return circunference.convert_to_json()
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_parabola(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("INSERT INTO parabola(vertice, p, eje_focal) values({0}, {1}, '{2}')".format(
                    id_point, data['p'], data['eje_focal']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_parabola = cursor.fetchone()[0]
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    parabola = entities.Parabola(id_parabola, a, "{0}".format(
                        data['p']), "{0}".format(data['eje_focal']))
                    return parabola.convert_to_json()
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_elipse(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("INSERT INTO elipse(centro, a,  b, eje_focal) values({0}, {1}, {2}, '{3}')".format(
                    id_point, data['a'], data['b'], data['eje_focal']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_elipse = cursor.fetchone()[0]
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    elipse = entities.Elipse(
                        id_elipse, a, data['a'], data['b'], "{0}".format(data['eje_focal']))
                    return elipse.convert_to_json()
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def create_hiperbola(self, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("INSERT INTO hiperbola(centro, a,  b, eje_focal) values({0}, {1}, {2}, '{3}')".format(
                    id_point, data['a'], data['b'], data['eje_focal']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_hiperbola = cursor.fetchone()[0]
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    hiperbola = entities.Hiperbola(
                        id_hiperbola, a, data['a'], data['b'], "{0}".format(data['eje_focal']))
                    return hiperbola.convert_to_json()
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)


# UPDATE METHODS

    @classmethod
    def update_point(self, id_punto, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("UPDATE punto SET coord_x = {0}, coord_y = {1} WHERE id_punto = {2}".format(
                    data['coord_x'], data['coord_y'], id_punto))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    point = entities.Punto(
                        id_punto, data['coord_x'], data['coord_y'])
                    return point
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_line(self, id_line, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_xa'], data['coord_ya']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point_a = cursor.fetchone()[0]
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_xb'], data['coord_yb']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point_b = cursor.fetchone()[0]
                cursor.execute("UPDATE recta SET punto_a = {0}, punto_b = {1} WHERE id_recta = {2}".format(
                    id_point_a, id_point_b, id_line))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point_a, data['coord_xa'], data['coord_ya'])
                    b = entities.Punto(
                        id_point_a, data['coord_xb'], data['coord_yb'])
                    line = entities.Recta(id_line, a, b)
                    return line
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_circunference(self, id_circunferencia, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("UPDATE circunferencia SET centro = {0}, radio = {1} WHERE id_circunferencia = {2}".format(
                    id_point, data['radio'], id_circunferencia))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    circunference = entities.Circunferencia(
                        id_circunferencia, a, data['radio'])
                    return circunference
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_parabola(self, id_parabola, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("UPDATE parabola SET vertice = {0}, p = {1}, eje_focal = '{2}' WHERE id_parabola = {3}".format(
                    id_point, data['p'], data['eje_focal'], id_parabola))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    parabola = entities.Parabola(
                        id_parabola, a, data['p'], "{0}".format(data['eje_focal']))
                    return parabola
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_elipse(self, id_elipse, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("UPDATE elipse SET centro = {0}, a = {1}, b = {2}, eje_focal = '{3}' WHERE id_elipse = {4}".format(
                    id_point, data['a'], data['b'], data['eje_focal'], id_elipse))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    elipse = entities.Elipse(
                        id_elipse, a, data['a'], data['b'], "{0}".format(data['eje_focal']))
                    return elipse
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def update_hiperbola(self, id_hiperbola, data):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO punto(coord_x, coord_y) values({0}, {1})".format(
                    data['coord_x'], data['coord_y']))
                cursor.execute("SELECT LAST_INSERT_ID();")
                id_point = cursor.fetchone()[0]
                cursor.execute("UPDATE hiperbola SET centro = {0}, a = {1}, b = {2}, eje_focal = '{3}' WHERE id_hiperbola = {4}".format(
                    id_point, data['a'], data['b'], data['eje_focal'], id_hiperbola))
                rows_affects = cursor.rowcount
                connection.commit()
                if rows_affects > 0:
                    a = entities.Punto(
                        id_point, data['coord_x'], data['coord_y'])
                    hiperbola = entities.Elipse(
                        id_hiperbola, a, data['a'], data['b'], "{0}".format(data['eje_focal']))
                    return hiperbola
                else:
                    return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_point(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM punto WHERE id_punto = {0}".format(id))
                row_affects = cursor.rowcount
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Point deleted successfully!'}
                else:
                    return {'message': 'Error, Delete point failed, point not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_line(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM recta WHERE id_recta = {0}".format(id))
                row_affects = cursor.rowcount
                print(row_affects)
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Line deleted successfully!'}
                else:
                    return {'message': 'Error, Delete line failed, line not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_circunference(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM circunferencia WHERE id_circunferencia = {0}".format(id))
                row_affects = cursor.rowcount
                print(row_affects)
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Circunference deleted successfully!'}
                else:
                    return {'message': 'Error, Delete Circunference failed, Circunference not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_parabola(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM parabola WHERE id_parabola = {0}".format(id))
                row_affects = cursor.rowcount
                print(row_affects)
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Parabola deleted successfully!'}
                else:
                    return {'message': 'Error, Delete parabola failed, parabola not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_elipse(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM elipse WHERE id_elipse = {0}".format(id))
                row_affects = cursor.rowcount
                print(row_affects)
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Elipse deleted successfully!'}
                else:
                    return {'message': 'Error, Delete elipse failed, elipse not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def delete_hiperbola(self, id):
        try:
            connection = conn.get_connection()
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM hiperbola WHERE id_hiperbola = {0}".format(id))
                row_affects = cursor.rowcount
                print(row_affects)
                connection.commit()
                if row_affects > 0:
                    return {'message': 'Hiperbola deleted successfully!'}
                else:
                    return {'message': 'Error, Delete hiperbola failed, hiperbola not found!'}
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_line_byid(self, id):
        try:
            data = self.get_line_byid(id)
            if data is not None:
                line = entities.Recta(0, 0, 0)
                line = line.convert_line_id(data[0])
                return line
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_circunference_byid(self, id):
        try:
            data = self.get_circunference_byid(id)
            if data is not None:
                circunference = entities.Circunferencia(0, 0, 0)
                circunference = circunference.convert_object_circunference_data(
                    data)
                return circunference
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_parabola_byid(self, id):
        try:
            data = self.get_parabola_byid(id)
            if data is not None:
                parabola = entities.Parabola(0, 0, 0, "y")
                parabola = parabola.convert_object_parabola_data(data)
                return parabola
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_elipse_byid(self, id):
        try:
            data = self.get_elipse_byid(id)
            if data is not None:
                elipse = entities.Elipse(0, 0, 0, 0, "y")
                elipse = elipse.convert_object_elipse_data(data)
                return elipse
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_hiperbola_byid(self, id):
        try:
            data = self.get_hiperbola_byid(id)
            print(data)
            if data is not None:
                hiperbola = entities.Hiperbola(0, 0, 0, 0, "y")
                hiperbola = hiperbola.convert_object_hiperbola_data(data)
                return hiperbola
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_line(self, data):
        try:
            if data is not None:
                line = entities.Recta(0, 0, 0)
                line = line.convert_line_data(data)
                return line
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_circunference(self, data):
        try:
            if data is not None:
                circunference = entities.Circunferencia(0, 0, 0)
                circunference = circunference.convert_data(
                    data)
                return circunference
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_parabola(self, data):
        try:
            if data is not None:
                parabola = entities.Parabola(0, 0, 0, "y")
                parabola = parabola.convert_data(data)
                return parabola
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_elipse(self, data):
        try:
            if data is not None:
                elipse = entities.Elipse(0, 0, 0, 0, "y")
                elipse = elipse.convert_data(data)
                return elipse
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_elements_hiperbola(self, data):
        try:
            if data is not None:
                hiperbola = entities.Hiperbola(0, 0, 0, 0, "y")
                hiperbola = hiperbola.convert_data(data)
                return hiperbola
            else:
                return None
        except Exception as ex:
            raise Exception(ex)
