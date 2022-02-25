import pandas as pd


def check_id(id_var):
    """Check whether the student id is valid or not.

    Argument:
        id_var: student id (str).

    Return:
        whether the student id student is valid or not (bool).
    """
    if len(id_var) == 9 and id_var[0] == 'N' and id_var[1:9].isdigit():
        return True
    else:
        return False


# Open and read file data
point = 'option'
while point == 'option':
    # Enter the correct file name -> start analyzing and calculating
    # Enter 'exit' --> exit the program
    # Enter the wrong file name --> automatically reload the input box
    try:
        file_name = input('Enter a class file to grade (i.e. class1 for class1.txt)'
                          + ' or \"exit\" to exit: ')
        file_data = open('Input/' + file_name + '.txt', 'r')
        print('Successfully opened ' + file_name + '.txt\n')
        point = 'start'
    except:
        if file_name == 'exit':
            print('Exit program.')
            point = 'end'
            exit()
        else:
            print('File cannot be found.')

# Scan files and analyze data
if point == 'start':
    print('**** ANALYZING  ****\n')

    total_valid_lines = 0
    total_invalid_lines_26 = 0
    total_invalid_lines_N = 0
    total_invalid_lines_26_N = 0

    valid_data = []
    list_id_student = []
    list_answers = []

    for line in file_data:
        line = line.strip()
        list_line = line.split()

        for element in list_line:
            element = element.split(',')
            # Case: line of data does not contain 26 values + correct student id
            if len(element) != 26 and check_id(element[0]) == True:
                total_invalid_lines_26 += 1
                print('Invalid line of data: does not contain exactly 26 values:')
                print(line + '\n')
            # Case: line of data contains 26 values + wrong student id
            elif len(element) == 26 and check_id(element[0]) == False:
                total_invalid_lines_N += 1
                print('Invalid line of data: N# is invalid')
                print(line + '\n')
            # Case: line of data does not contain 26 values + wrong student id
            elif len(element) != 26 and check_id(element[0]) == False:
                total_invalid_lines_26_N += 1
                print('Invalid line of data: does not contain exactly 26 values:')
                print(line + '\n')
                print('Invalid line of data: N# is invalid')
                print(line + '\n')
            # Case: line of data + student id is valid and in the correct format
            else:
                valid_data.append(line)
                list_id_student.append(element[0])
                list_answers.append(element[1:])
                total_valid_lines += 1

    file_data.close()

    # Calculate the number of invalid lines of data
    total_invalid_lines = total_invalid_lines_26 \
        + total_invalid_lines_N \
        + total_invalid_lines_26_N

    if total_invalid_lines == 0:
        print('No errors found!\n')

    print('**** REPORT ****\n')
    print('Total valid lines of data: {}'.format(total_valid_lines))
    print('Total invalid lines of data: {}\n'.format(total_invalid_lines))

# Calculating the exam grades

    # Create a dictionary: each key is the student id, value is the
    # corresponding list of answers
    dict_data = dict()
    for id_student, answers in zip(list_id_student, list_answers):
        dict_data[id_student] = answers

    # Create a data table: columns are student ids, rows are answers
    data = pd.DataFrame(dict_data)

    answer_key = "B,A,D,D,C,B,D,A,C,C,D,B,A,B,A,C,B,D,A,C,A,A,B,D,D"
    list_answer_key = answer_key.split(',')
    data['Answer_key'] = list_answer_key

    # Compare the answer with the Answer_key column and reassign the
    # corresponding grade
    for column, value_1 in data.iteritems():
        for row, value_2 in data.iterrows():
            if data.loc[row, column] == data.loc[row, 'Answer_key']:
                data.loc[row, column] = 4
            elif data.loc[row, column] == '':
                data.loc[row, column] = 0
            else:
                data.loc[row, column] = -1

    data = data.drop(['Answer_key'], axis=1)
    data = data.astype(int)

    print('Mean (average) score: {:.2f}'.format(float(data.sum().mean())))
    print('Highest score: {}'.format(data.sum().max()))
    print('Lowest score: {}'.format(data.sum().min()))
    print('Range of scores: {}'.format(data.sum().max() - data.sum().min()))
    print('Median score: {}'.format(data.sum().median()))

# Export the result file
    export_data = pd.DataFrame(data.sum())
    export_data.to_csv('Output/' + file_name + '_grades.txt', header=False)
