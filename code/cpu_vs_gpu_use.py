import sys
import numpy as np

# import tensorflow as tf
import tensorflow.compat.v1 as tf
tf.disable_v2_behavior()

from datetime import datetime
shape = (100, 100)

def main(device_name):
    with tf.device(device_name):
        random_matrix = tf.random_uniform(shape=shape, minval=0, maxval=1)
        dot_operation = tf.matmul(random_matrix, tf.transpose(random_matrix))
        sum_operation = tf.reduce_sum(dot_operation)
    startTime = datetime.now()
    with tf.Session(config=tf.ConfigProto(log_device_placement=True)) as session:
            result = session.run(sum_operation)
            print(result)
    # It can be hard to see the results on the terminal with lots of output -- add some newlines to improve readability.
    print("\n" * 5)
    print("Shape:", shape, "Device:", device_name)
    print("Time taken:", str(datetime.now() - startTime))

# main('/gpu:0')
# main('/cpu:0')
main('/device:XLA_GPU:0')
